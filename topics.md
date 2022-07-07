* <s>Log into local & remote graphical and text mode consoles</s> 
* <s>Search for files</s> [Find](/find.md)
* <s>Evaluate and compare the basic file system features and options [FS](/file_system.md)</s>
* <s>Compare and manipulate file content</s> [Diff](/diff.md)
* <s>Use input-output redirection (e.g . >, >>, |, 2>)</s> 
* Analyze text using basic regular expressions
* <s>Archive, backup, compress, unpack, and uncompress files)</s> [Here](/compress_backup.md)
* <s>Create, delete, copy, and move files and directories</s>
* <s>Create and manage hard and soft links</s>
* <s>List, set, and change standard file permissions + SUID, SGID, STICKY BIT</s> [Here](/file_perrmissions.md)
* <s>Read, and use system documentation</s>
* <s>Manage access to the root account/specific privileges to users and groups</s> [Here](/root_access.md)
---
* <s>Boot, reboot, and shut down a system safely</s>
* <s>Boot or change system into different operating modes</s> [RUNLEVEL](/run_levels.md) **TBC**
* Install, configure and troubleshoot bootloaders
* Diagnose and manage processes using: [top](/top.md), [ps](/ps.md), [kill](/kill.md), [nice](/nice.md) [netstat](/netstat.md)**TBC**
* <s>Locate and analyze system log files</s> [Linux](/logging.md), [systemd](/loggd.md) **TBC** 
* <s>Schedule tasks to run at a set date and time</s> [Cron](/cron.md) 
* <s>Verify completion of scheduled jobs</s> **"Write a logging utility that tracks events"**
* Update software to provide required functionality and security
* Verify the integrity and availability of resources **?**
* Verify the integrity and availability of key processes **?**
* <s>Change kernel runtime parameters, persistent and non-persistent</s> [Here](/runtime_parameters.md)
* <s>**Use scripting to automate system maintenance tasks** </s> [Here](/scripts_for_system_maintenance/)
* <s>Manage the startup process and services (In Services Configuration)</s> [Here](/systemd.md)
* List and identify SELinux/AppArmor file and process contexts
* <s>Identify the component of a Linux distribution that a file belongs to</s> [Here](/identify_which_file_belongs_to.md) **TBC**
* Systemd - [here](/systemd.md) **TBC**
---
* <s>Create, delete, and modify local user accounts</s>
* <s>Create, delete, and modify local groups and group memberships</s>
* <s>Manage system-wide environment profiles</s> [Here](/env_profiles.md)
* <s>Manage template user environment</s> [Read](/template_usr_env.md) **TBC**
* <s>Configure user resource limits</s> [Here](/usr_resource_limits.md)
* <s>Manage user privileges</s> **chmod** 
---
* Configure networking and hostname resolution statically or dynamically [nmcli](/nmcli.md) **TBC**
* <s>Configure network services to start automatically at boot</s> [via systemd](/start_stop_network_service.md)
* <s>Implement packet filtering</s> [Ip tables](/packet_filtering.md)
* <s>Start, stop, and check the status of network services</s> [via systemd](/start_stop_network_service.md)
* <s>Statically route IP traffic [ip route](/static_ip_routing.md)
* Synchronize time using other network peers [tut](https://www.rootusers.com/how-to-synchronize-time-in-linux-with-ntp-peers/)
---
* Configure a caching DNS server
* Maintain a DNS zone
* Configure email aliases
* Configure SSH servers and clients
* Restrict access to the HTTP proxy server
* Configure an IMAP and IMAPS service
* Query and modify the behavior of system services at various operating modes
* Configure an HTTP server
* Configure HTTP server log files
* Configure a database server
* Restrict access to a web page
* Manage and configure containers
* Manage and configure Virtual Machines 
---
* <s>List, create, delete, and modify physical storage partitions</s> [fdisk](/command_line_utilities/fdisk.md)
* Manage and configure LVM storage
* Create and configure encrypted storage
* <s>Configure systems to mount file systems at or during boot</s> **fstab**
* <s>Configure and manage swap space [swap](/swap.md)</s> **TBA LVM swap space**
* Create and manage RAID devices
* Configure systems to mount file systems on demand [autofs](/autofs.md) *not mounting on min*
* Create, manage and diagnose advanced file system permissions
* Setup user and group disk quotas for filesystems [Quota](/quota.md)
* <s>Create and configure file systems</s> **mkfs fdisk dd**
---
