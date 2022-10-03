# Logging

## Systemd Journal Basics

The journal is controlled by the systemd-journald daemon. It collects information from different sources and loads the messages into the journal.

The systemd journal is not a large text file. It’s a binary file maintained by the daemon. So, it can’t be opened with a text editor. The location and size of this binary file is controlled by the daemon’s configuration file. It doesn’t have to be persistent either; using configuration parameters, an administrator can turn off journaling altogether or keep it in memory so it’s volatile in nature. With in-memory journaling, systemd creates its journal files under the `/run/log/journal` directory. The directory is created if it doesn’t exist. With persistent storage, the journal is created under /`var/log/journal` directory; again, the directory is created by systemd if needed. If this directory is deleted for some reason, systemd-journald will not re-create it automatically; rather, it will write the logs under /run/log/journal in a non-persistent way. It will re-create the directory when the daemon is restarted.

The main configuration file for systemd-journald is `/etc/systemd/journald.conf`. All the parameters are commented out, meaning the values are already known to systemd as default values. [journal.conf documentation for setting](https://www.freedesktop.org/software/systemd/man/journald.conf.html)

## Managing Journal Size

By default, systemd-journald ensures older journal records or journal files are deleted in order to keep a certain amount of disk space free. In the Linux Logging with Systemd section, we explain how to control the thresholds for deleting old log data with configuration parameters. 

* `journalctl --disk-usage` - check how much disk space is currently taken up by the journal.

## Deleting or Vacuuming Journals

* To delete archived journal entries manually, you can use either the –vacuum-size or the –vacuum-time option. In the example below, we are deleting any archived journal files, so the journal size comes back to 200MB.

	* `journalctl --vacuum-size=200M`

* You can also use the --vacuum-files option, which deletes all but the specified number of journal files. For example, if you have 10 archived journal files and want to reduce these down to 2, you can do so by running the following command:

	* `journalctl --vacuum-files=2` 

## Verifying Journals

* `journalctl --verify` - verify the journal for internal consistency

## Time Ranges

* `journalctl --since "1 hour ago"` - 
* `journalctl --since "2015-06-26 23:15:00" --until "2015-06-26 23:20:00"` - 

## By Unit

* `journalctl -u nginx.service` - The command below will show all messages logged by the Nginx web server. You can use the --since and --until switches here to pinpoint web server errors occurring within a time window.

* `journalctl -u mysql.service -f` - this command “follows” the mysql service log.
* `journalctl -u cron.service -n 5 --since "1 hour ago" -r` - shows 5 latest(-r reversed) cron entries from last hour.

## Output Formats

* `journalctl -u apache2.service -r -o json-pretty` - json output
* `journalctl -u cron --since "10 minute ago" -n 1 -r -o json-pretty | jq '._PID' | sed 's/"//g' ` - just aqtual number

## By Priority

* `journalctl -b -1  -p "emerg".."crit"` - by priority or severity. it can be numerical as well. `0 or “emerg”, 1 or “alert”, 2 or “crit”, 3 or “err”, 4 or “warning”, 5 or “notice”, 6 or “info”  7, or “debug”`.

## Systemd module loading time
`systemd-analyze critical-chain`
`systemd-analyze blame`


`Since i started woking in this Unit all priorities Reversed, Until i left my life was a Vacuum`




---
**Resources** :
	
[loggy](https://www.loggly.com/ultimate-guide/using-systemctl/)