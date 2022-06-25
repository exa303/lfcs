# Systemd 

Systemd is a system and service manager for Linux. It’s become the de facto system management daemon in various Linux distributions in recent years. Systemd was first introduced in Fedora. Other distributions like Arch Linux, openSUSE, or CoreOS have already made it part of their operating systems. Red Hat Enterprise Linux (RHEL) and its downstream distros like CentOS started to use systemd natively from version 7. Another major distribution, Ubuntu—which had introduced another service management daemon called Upstart—started shipping with systemd from version 15.04.

The reason for this wide-scale adoption is the versatility of systemd. It manages not only daemons and processes in a Linux system, but also various resources like devices, sockets, and mount points. When the system boots, it does not load services sequentially like System V, which saves significant time at startup. Services are loaded in parallel, and a service waits until other required resources for it are also activated.

Systemd is backward compatible with predecessors like System V init and Upstart. That means any service still using older System V init scripts for starting will work under systemd, and you can use systemd commands like systemctl to start, stop, and check the service’s status. Another advantage of systemd is its ease of configuration. Systemd is controlled by unit files that are declarative in nature and easy to understand. This contrasts with System V where the application’s developer had to create complicated shell scripts for starting, stopping, or reloading the service.


**Units and Targets**

At the heart of systemd are unit files. A unit file is a plain text file that lives under the `/lib/systemd/system` directory and has a type associated with it. A unit file basically describes a resource and tells systemd how to activate that resource. The naming standard for a unit file is `<resource_name>.<unit_type>`. The different types of units include `service`, `path`, `mount point`, `automount`, `swap`, `target`, `timer`, `device`, and `socket`. So, we have unit files like `cron.service`, `tmp.mount`, `syslog.socket`, or `graphical.target`. For each service unit that’s enabled, a symbolic link to the unit file is placed under the `/etc/systemd/system/<target>.wants/` directory, this directory contains runlevel.target files.

A target unit is a special kind of unit file because it doesn’t represent a single resource; rather, it groups other units to bring the system to a particular state. Target units in systemd loosely resemble run levels in System V in the sense that each target unit represents a particular system state. For example, the graphical.target unit represents a system that has booted in multi-user, graphical mode, similar to System V’s runlevel 5. Multi-user.target, on the other hand, is similar to runlevel 3 (multi-user, text mode with networking enabled). However, targets are also different from runlevels because in System V, a Linux box can exist in only one runlevel at any time. In systemd, target units are inclusive. A target unit can group other target units when it’s coming up—so it’s possible for a system to remain in more than one target. Going back to the graphical.target example, when the target comes up, it also activates multi-user.target.


### Using systemctl
Systemctl is an extremely powerful Linux utility that comes with systemd. It comes with a long list of options for different functionality, the most common of which are starting, stopping, restarting, or reloading a daemon. In the following examples, we will see how we can use systemctl for some of the troubleshooting purposes.

**Units**

* `systemctl list-unit-files --type=service` - To check which services are installed in the local Linux system, execute this command (we are assuming you are the root user).

* `systemctl list-units --type=service --state=running` - services that are actually running or currently active in memory.

* `systemctl list-dependencies <unit file>` - The following command shows the resources a service unit will depend on or the resource units that will depend on this service in recursive manner.

* `systemctl --failed` - units that failed to load or activate, they’ll be listed here.

* If you suspect a particular service failed, you can use the is-failed parameter with systemctl. Taking the example of apache2.service, if we execute the following command:
	* `systemctl is-failed apache2.service`

* `systemctl enable specific.service` - this will make specific service start at boot.

### Troubleshooting

* `systemd-analyze` - systemd-analyze can provide valuable information about total time taken by the boot process. 
* `systemd-analyze blame` - it will give detailed time how long it took for a each service to start. This can be a valuable tool to consider if your server is taking a long time to boot and you’re not sure what the cause is.
