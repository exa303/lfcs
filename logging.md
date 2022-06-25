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