### Linux System Logs
Linux has a special directory for storing logs called `/var/log.`
* `var/log/syslog` and `/var/log/messages` store all global system activity data, including startup messages. Debian-based systems like Ubuntu store this in `/var/log/syslog`, while Red Hat-based systems like RHEL or CentOS use `/var/log/messages`.

* `/var/log/auth.log` and /var/log/secure store all security-related events such as logins, root user actions, and output from pluggable authentication modules (PAM). Ubuntu and Debian use `/var/log/auth.log`, while Red Hat and CentOS use `/var/log/secure`.

* `/var/log/kern.log` stores kernel events, errors, and warning logs, which are particularly helpful for troubleshooting custom kernels.
* `/var/log/cron` stores information about scheduled tasks (cron jobs). Use this data to verify that your cron jobs are running successfully.

## Analyzing

* `grep "user hoover" /var/log/auth.log` - plain grep

* Surround Search - Using surround search returns a number of lines before or after a match. This provides context for each event by letting you trace the events that led up to or immediately followed the event. The `-B` flag specifies how many lines to return before the event, and the `-A` flag specifies the number of lines after.
	* `grep -B 3 -A 2 'Invalid user' /var/log/auth.log`

* `grep -B 3 -A 2 'Invalid user' /var/log/auth.log` - using tail and grep in combination to search for a specific tool.

* One of the most common things people want to see in their logs are errors. Unfortunately, the default syslog configuration doesn’t output the severity of errors directly, making it difficult to filter on them.There are two ways you can solve this problem. First, you can modify your rsyslog configuration in `/etc/rsyslog.conf`. with:
	* `"<%pri-text%> : %timegenerated%,%HOSTNAME%,%syslogtag%,%msg%n"`
* Second use awk:
	* `awk '/.err>/ {print}' /var/log/auth.log`

* get the number of attempted failed logins:
	* `grep "FAILED su for" /var/log/auth.log | cut -d ' ' -f 9 | sort | uniq -c | sort -nr` - sort, count occurencies with uniq, sort(usualy it sorts from smallest to larges) again reversed.

* memory issues:
	* `grep "Out of memory" /var/log/syslog`

* The cron daemon is a scheduler that runs commands at specified dates and times. If the process fails to run or fails to finish, then a cron error appears in your log files. You can find these files in `/var/log/cron`, `/var/log/messages`, and `/var/log/syslog`.

*	By default, cron jobs output to syslog and appear in the /var/log/syslog file. You can also redirect the output of your cron commands to another destination, such as standard output or another file. In this example, we pipe “Hello world” to the logger command. This creates two log events: one from cron, and one from the logger command. The -t parameter sets the app name to “helloCron”:

```
$ crontab -e
*/5 * * * * echo 'Hello World' 2>&1 | /usr/bin/logger -t helloCron

```

### Managing Linux Logs

Centralizing your logs makes searching through log data easier and faster, since all of your logs are accessible in a single location. Instead of guessing which server has the correct file, you can simply access your repository of log data to search for relevant events. Centralization is a key part of large management solutions, as it allows them to analyze, parse, and index logs before storing them in a single location. This makes troubleshooting and solving production issues easier and faster. Centralization also offers these benefits.

*	Logs are backed up in a separate location, protecting them against accidental or unintentional loss. This also keeps them accessible in case your servers go down or become unresponsive.
*	You don’t have to use SSH or inefficient grep commands, which can use valuable computing resources for complex searches.
*	You can reduce the amount of disk space used by log files.
*	Engineers can troubleshoot production issues without directly accessing systems.

While centralized log management is generally the better option, there are still some risks such as poor net connectivity leading to data loss, or logs using a great deal of network bandwidth. We’ll discuss how to intelligently address these issues in the sections below.


### Configure Rsyslog.conf

The main rsyslog configuration file is located at `etc/rsyslog.conf.` You can store additional configuration files in the `/etc/rsyslog.d/` directory. For example, on Ubuntu, this directory contains `/etc/rsyslog.d/50-default.conf`, which instructs rsyslog to write the system logs to file.

Rsyslog provides the imfile module, which allows it to monitor log files for new events. This lets you specify a file or directory as a log source. Rsyslog can monitor individual files as well as entire directories.

For example, we want to monitor log files created by the Apache server. We can do so by creating a new file in `/etc/rsyslog.d/` called `apache.conf`, load the imfile module, and add Apache’s log files as inputs:
```
# Apache access log:
input(type="imfile" File="/var/log/apache2/access.log" Tag="apache-access" Severity="info")
# Apache error file:
input(type="imfile" File="/var/log/apache2/error.log" Tag="apache-error" Severity="warning")

```

## syslog priorities ( Syslog severity levels )

rsyslog.service is reading journald (which you can display by `journalctl` command), and sorting its output based by setting and priorities found in `/etc/rsyslog.d/50-default.conf` file. Priorities ar categorised just like they are in any programing language or logging library.

```
Number: 0					
Severity: EMERGENCY					
Suggested Actions: A "panic" condition affecting multiple applications, servers, or sites. System is unusable. Notify all technical staff on call.

Number: 1					
Severity: ALERT					
Suggested Actions: A condition requiring immediate correction, for example, the loss of a backup ISP connection. Notify staff who can fix the problem.

Number: 2					
Severity: CRYTICAL					
Suggested Actions: A condition requiring immediate correction or indicating a failure in a primary system, for example, a loss of a primary ISP connection. Fix CRITICAL issues before ALERT-level problems.

Number: 3					
Severity: ERROR			
Suggested Actions: Non-urgent failures. Notify developers or administrators as errors must be resolved within a given time.

Number: 4					
Severity: WARNING					
Suggested Actions: Warning messages are not errors, but they indicate that an error will occur if required action is not taken. An example is a file system that is 85% full. Each item must be resolved within a given time.

Number: 5					
Severity: NOTICE					
Suggested Actions: Events that are unusual but are not error conditions. These items might be summarized in an email to developers or administrators to spot potential problems. No immediate action is required.

Number: 6					
Severity: INFORMATIONAL 					
Suggested Actions: Normal operational messages. These may be harvested for network maintenance functions like reporting and throughput measurement. No action is required.

Number: 7					
Severity: DEBUG					
Suggested Actions: Information useful to developers for debugging an application. This information is not useful during operations.

```

* `cron.*                          /var/log/cron.log` - cron = facility . * =priority(Sverity)




### Which Protocol: UDP, TCP, or RELP?

There are three main protocols you can choose from when transmitting log data: UDP, TCP, and RELP.

* `UDP` sends messages without guaranteeing delivery or an acknowledgement of receipt (ACK). It makes a single attempt to send a packet, and if the delivery fails, it does not try again. It’s much faster and uses fewer resources than other protocols, but should only be used on reliable networks such as localhost. UDP also doesn’t support encrypting logs.

* `TCP` is the most commonly used protocol for streaming over the Internet, since it requires an ACK before sending the next packet. If the delivery fails, it will continue retrying until it successfully delivers the message. However, TCP requires a handshake and active connection between the sender and the receiver, which uses additional network resources.

* `RELP` (Reliable Event Logging Protocol) is designed specifically for rsyslog and is arguably the most reliable of these three protocols. It acknowledges receipt of data in the application layer and will resend if there is an error. Since it’s less common, you will need to make sure your destination also supports this protocol.

If rsyslog encounters a problem when storing logs, such as an unavailable network connection, it will queue the logs until the connection is restored. The queued logs are stored in memory by default. However, memory is limited and if the problem persists, the logs can exceed memory capacity, which can lead to data loss. To prevent this, consider using disk queues.

***Warning: You can lose data if you store logs only in memory.***


### Reliably Send with Disk-assisted Queues

Rsyslog can queue your logs to disk when memory is full. Disk-assisted queues make transport of logs more reliable. Here is an example of how to configure a log forwarding rule in rsyslog with a disk-assisted queue.

```
action(type="omfwd"		# Use with the omfwd module
	protocol="tcp"		# Use the TCP protocol
	target="myserver"	# Target server address
	port="6514"		# Target server port
queue.filename="fwdRule1"	# Prefix for backup files created on disk
queue.maxDiskSpace="1000000000"	# Reserve 1GB of disk space
queue.saveOnShutdown="on"	# Save messages to disk on shutdown
queue.type="LinkedList"		# Allocate memory dynamically
action.resumeRetryCount="1"	# Keep trying if the target server can’t be contacted)
```


---
**Resources:**
[loggy](https://www.loggly.com/ultimate-guide/managing-linux-logs/)
[solarwinds](https://documentation.solarwinds.com/en/success_center/orionplatform/content/core-syslog-message-priorities-sw2141.htm)