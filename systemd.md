## Using systemctl
Systemctl is an extremely powerful Linux utility that comes with systemd. It comes with a long list of options for different functionality, the most common of which are starting, stopping, restarting, or reloading a daemon. In the following examples, we will see how we can use systemctl for some of the troubleshooting purposes.

**Listing Units**

* `systemctl list-unit-files --type service` - To check which services are installed in the local Linux system, execute this command (we are assuming you are the root user).