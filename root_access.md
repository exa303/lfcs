### Grant Root Privileges

* `visudo` - edit /etc/sudoers.temp file with visudo program

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
your_user ALL=(ALL:ALL) ALL  //<---

```
* Here, "root ALL=(ALL:ALL) ALL" states that the user root, logged in to any hostname, may run, as any user or group, any command. The general form of this directive is:

	* ` user hostname=(runas-user:runas-group) command `

* If user begins with a %, it's interpreted as the name of a group, and the directive applies to all users in that group. So the line "%admin ALL=(ALL) ALL" allows any user belonging to the group admin to run any command as any user or group.

* Here, "root ALL=(ALL:ALL) ALL" states that the user root, logged in to any hostname, may run, as any user or group, any command. The general form of this directive is:
	* `user hostname=(runas-user:runas-group) command`

---
* Example 1 - User hope, when logged in to host myhost, may run the command mysqldump as user mysqluser or a member of group mysqlusers. For example, this directive would allow user hope to run this command:

	* `hope myhost=(mysqluser:mysqlusers) mysqldump`




