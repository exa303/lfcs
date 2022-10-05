### Nice

Linux can run a lot of processes at a time, which can slow down the speed of some high priority processes and result in poor performance.

To avoid this, you can tell your machine to prioritize processes as per your requirements.

This priority is called Niceness in Linux, and it has a value between -20 to 19. The lower the Niceness index, the higher would be a priority given to that task.

The default value of all the processes is 0.

* To start a process with a niceness value other than the default value use the following syntax:
	* `nice -n 'Nice value' process name`   `Nice Number`
* If there is some process already running on the system, then you can ‘Renice’ its value using syntax:
	* `renice 'nice value' -p 'PID'`