# ps - Process status

* Find out processes that use most of the resourcess lime memory:
	* `ps -Ao %mem,%cpu,command --sort=-%mem  | head -5`

* Check for process pid by using name or command:
	* `ps -C httpd`

* `px -au <user name>`

Flags:

* `-g` - select by group `ps -g <groupname>`
* `-a` - Select all processes except both session leaders (see getsid(2)) and processes not associated with a terminal.

* `r` - restrict output to running processes only.
* `x` - Lift the BSD-style

* `-u` - select by user
* `-f` - format, `-F full formatt`.	

## Process state codes

   D    uninterruptible sleep (usually IO)
   I    Idle kernel thread
   R    running or runnable (on run queue)
   S    interruptible sleep (waiting for an event to complete)
   T    stopped by job control signal
   t    stopped by debugger during the tracing
   W    paging (not valid since the 2.6.xx kernel)
   X    dead (should never be seen)
   Z   a defunct ("zombie") process

## Examples

* `ps -u avx` - get all processes by user avx.
