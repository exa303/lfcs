### ps

* `ps ux` - To check all the processes running under a user, use the command.
* `ps PID` - You can also check the process status of a single process, use the syntax.
* `ps --pid 1` or `ps -p 1` - get the name of process which has id 1
* `ps -eo %mem` - `e` selects all of the processes `o` formats output, in this case just show %mem
`-e == -A` can use `A` like All insted of e.
	* `ps -Ao %mem,command --sort=-%mem` - will sort processes from all of processes that take most of memory and will show how much memory it is taking also will show FULL command of the process. `command` can be shortened to `comm` for SHORT command. **DO NOT FORGET `,` and NO SPACES** 
