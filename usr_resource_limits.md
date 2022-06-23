# Configure user resource limits and restrictions in Linux

On the command line, we changed from where we were into `/etc/security` and we then listed all the content in that directory as shown above. The particular file that we are interested in is `limits.conf` So the next thing to do is to use a text editor like vim or even nano so go into the configuration file `limits.conf` and make any changes that we want.

The configuration file on its own holds a lot of valuable information that can guide us through. The format it follows is `<domain> <type> <item> <value>`.

A domain can be a user or group let us assume that we have a group called @techdirectarchive and a user called @raphael (it is always a good practice to put a @in front of a domain element). The type can either be a hard or a soft limit, item can be the size of the core, the size of nproc. The value is usually the restriction that you want to set. If for example, you want a particular group called coders to have only 30 processes running, the value will be 30.

`Hard` limit means that the limit will be enforced.
A `soft` limit is the type of limit that is not enforced immediately and sends a warning to the user before continuing the next line of action.

If a hard limit or soft limit of a resource is set to a valid value, but outside of the supported range of the local system, the system may reject the new limit or unexpected behavior may occur. If the control value required is used, the module will reject the login if a limit could not be set.

In general, individual limits have priority over group limits, so if you impose no limits for admin group, but one of the members in this group have a limits line, the user will have its limits set according to this line.

Also, please note that all limit settings are set per login. They are not global, nor are they permanent; existing only for the duration of the session.

In the limits configuration file, the '#' character introduces a comment - after which the rest of the line is ignored.

The pam_limits module does report configuration problems found in its configuration file and errors via syslog

### Settings
* `core` - limits the core file size (KB) 
* `data` - maximum data size (KB) 
* `fsize` - maximum filesize (KB) 
* `memlock` - maximum locked-in-memory address space (KB) 
* `nofile` - maximum number of open files 
* `rss` - maximum resident set size (KB) (Ignored in Linux 2.4.30 and higher) 
* `stack` - maximum stack size (KB) 
* `cpu` - maximum CPU time (minutes) 
* `nproc` - maximum number of processes 
* `as` - address space limit (KB) 
* `maxlogins` - maximum number of logins for this user except for this with uid=0 
* `maxsyslogins` - maximum number of all logins on system 
* `priority` - the priority to run user process with (negative values boost process priority) 
* `locks` - maximum locked files (Linux 2.4 and higher) 
* `sigpending` - maximum number of pending signals (Linux 2.6 and higher) 
* `msgqueue` - maximum memory used by POSIX message queues (bytes) (Linux 2.6 and higher) 
* `nice` - maximum nice priority allowed to raise to (Linux 2.6.12 and higher) values: [-20,19] 
* `rtprio ` - maximum realtime priority allowed for non-privileged processes (Linux 2.6.12 and higher) 
All items support the values -1, unlimited or infinity indicating no limit, except for priority and nice. 

###
* `ulimit -a` - shows all summary of preset limits
* `ulimit -n` - shows all possible open files
* `ulimit -Hn` - shows open files HARD limit. `ulimit -Sn` - shows open files SOFT limit.

---

 If you want to increase the limit shown by ulimit -n, you should:
* Modify /etc/systemd/user.conf and /etc/systemd/system.conf with the following line (this takes care of graphical login):
 	* `DefaultLimitNOFILE=65535`

* Modify /etc/security/limits.conf with the following lines (this takes care of non-GUI login):
 	*  ```mkasberg hard nofile 65535
 	   	  mkasberg soft nofile 65535```

* Reboot your computer for changes to take effect.
