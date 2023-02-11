# Rsyslog

## Default rsyslog.conf settings

* The default /etc/rsyslog.conf file should contain something like the following:

```bash
auth,authpriv.*               /var/log/auth.log
*.*;auth,authpriv.none        -/var/log/syslog
daemon.*                      -/var/log/daemon.log
kern.*                        -/var/log/kern.log
lpr.*                         -/var/log/lpr.log
mail.*                        -/var/log/mail.log
user.*                        -/var/log/user.log

mail.info                     -/var/log/mail.info
mail.warn                     -/var/log/mail.warn
mail.err                      /var/log/mail.err

*.=debug;\
  auth,authpriv.none;\
  news.none;mail.none         -/var/log/debug
*.=info;*.=notice;*.=warn;\
  auth,authpriv.none;\
  cron,daemon.none;\
  mail,news.none              -/var/log/messages

*.emerg                       :omusrmsg:*

```
The purpose of these settings is to sample a stream of incoming messages and route them as appropriate into different log files (or by other means such as email or system-wide alerts).

The first column is a filter to capture a subset of messages and pipe them into a specific log file, or take other action. The destination log files appear on the right.

For the curious, omusrmsg stands for "User Message Output Module" and combined with '*' will send a console alert to all logged in users. For example, when the system is going down for reboot.


## Security Levels

<table id="table1l" class="collapse">
<thead>
<tr>
<th>Code</th>
<th>Rsyslog</th>
<th>Severity</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>emerg, panic</td>
<td>Emergency: system is unusable</td>
</tr>
<tr>
<td>1</td>
<td>alert</td>
<td>Alert: action must be taken immediately</td>
</tr>
<tr>
<td>2</td>
<td>crit</td>
<td>Critical: critical conditions</td>
</tr>
<tr>
<td>3</td>
<td>err, error</td>
<td>Error: error conditions</td>
</tr>
<tr>
<td>4</td>
<td>warning, warn</td>
<td>Warning: warning conditions</td>
</tr>
<tr>
<td>5</td>
<td>notice</td>
<td>Notice: normal but significant condition</td>
</tr>
<tr>
<td>6</td>
<td>info</td>
<td>Informational: informational messages</td>
</tr>
<tr>
<td>7</td>
<td>debug</td>
<td>Debug: debug-level messages</td>
</tr>
</tbody>
</table>

So when we read from rsyslog.conf that /var/log/mail.info receives messages from the 'mail' facility with a security level of "info or higher" what we mean is that the mail.info log also collects entries destined for: mail.notice, mail.warn, mail.err, mail.crit, mail.alert and mail.emerg (so higher in severity), but not mail.debug which is less severe than 'info'.

## How the filters work

As described earlier, the column on the left is a filter, and in that column you have entries using the format:
`<facility>.<security level>`
For example:

* `auth,authpriv.*` - matches all messages from the auth or authpriv facilities.
* `*.*;auth,authpriv.none` - matches all messages from all facilites, but excluding any from auth or authpriv.
* `mail.info` - matches messages from the mail facility with security levels of 'info' or higher.
* `mail.warn` - matches messages from the mail facility with security levels of 'warn' or higher.
* `*.=debug;` - matched messages from all facilities with the 'debug' security level and no other. 


You can deduce from this that some messages will appear in multiple log files, which is something we want to keep an eye on and control.

For example, with the above settings, an incoming message with status mail.info will appear in three (3) log files: syslog, mail.log and mail.info. While a message with status mail.err will be logged to five (5) log files, namely: syslog, mail.log, mail.info, mail.warn, and mail.err.

And a message logged from iptables with --log-level 7 will arrive with a status of kern.debug and be logged to three (3) separate log files: syslog, kern.log and debug.

You can monitor these files in real-time from the command-line:

```bash 
cd /var/log
tail -fn0 syslog mail.err mail.warn mail.info mail.log kern.log debug
```

## Less duplication in the mail logs


Old settings

```bash
*.*;auth,authpriv.none        -/var/log/syslog
mail.*                        -/var/log/mail.log
mail.info                     -/var/log/mail.info
mail.warn                     -/var/log/mail.warn
mail.err                      /var/log/mail.err
```

New settings

```bash
*.*;auth,authpriv,mail.none   -/var/log/syslog
mail.*                        -/var/log/mail.log
mail.warn                     /var/log/mail.err
```


Now we have just two logfiles for 'mail'. The mail.log for all entries, and mail.err for 'warn', 'error', and any more severe messages.

## Less duplication in the iptables logs


https://www.the-art-of-web.com/system/rsyslog-config/