# lsof (list of open files)

* `lsof -u [user-name]` - list files opened by user
* `lsof -i 4` - ipv4 adressess
* `lsof -c apache` - opened by program name
* `lsof -p` - files opened by process.
* `list -t <filename>` - show proces ids that are using this file

* `lsof -i :80` - which programm is using port 80
    * `lsof -i :https` 
* `lsof -i udp`
* `lsof -a -i -u www-data` - By using a combination of the -i and -u command-line options, we can search for all network connections of a Linux user. This can be helpful if you inspect a system that might have been hacked. In this example, we check all network activity of the user www-data: 

