
# Priority and nice values

**Priority value** — The priority value is the process’s actual priority which is used by the Linux kernel to schedule a task.
In Linux system priorities are 0 to 139 in which 0 to 99 for real-time and 100 to 139 for users.
**0 = Highest, 139 = Lowest**

**Nice value** — Nice values are user-space values that we can use to control the priority of a process. The nice value range is -20 to +19 where -20 is highest, 0 default and +19 is lowest.


## Commands:

* Start the process with the nice value in the command as
`nice -n nice_val [command]`

* Change the nice value of a running process using its PID using renice as `renice -n nice_val -p [pid]`


