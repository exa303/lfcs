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

