### TOP

* top -
```
Field 	Description 	Example 1 	Example 2
PID 	The process ID of each task 	1525 	961
User 	The username of task owner 	Home 	Root
PR 	Priority

Can be 20(highest) or -20(lowest)
	20 	20
NI 	The nice value of a task 	0 	0
VIRT 	Virtual memory used (kb) 	1775 	75972
RES 	Physical memory used (kb) 	100 	51
SHR 	Shared memory used (kb) 	28 	7952
S 	Status

There are five types:

‘D’ = uninterruptible sleep

‘R’ = running

‘S’ = sleeping

‘T’ = traced or stopped

‘Z’ = zombie
	

%CPU 	% of CPU time 	1.7 	1.0
%MEM 	Physical memory used 	10 	5.1
TIME+ 	Total CPU time 	5:05.34 	2:23.42
Command 	Command name 	Photoshop.exe 	Xorg 
```