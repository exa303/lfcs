# Systemd 

## Using systemctl
Systemctl is an extremely powerful Linux utility that comes with systemd. It comes with a long list of options for different functionality, the most common of which are starting, stopping, restarting, or reloading a daemon. In the following examples, we will see how we can use systemctl for some of the troubleshooting purposes.

**Listing Units**

* `systemctl list-unit-files --type=service` - To check which services are installed in the local Linux system, execute this command (we are assuming you are the root user).

* `systemctl list-units --type=service --state=running` - services that are actually running or currently active in memory.

* `systemctl list-dependencies <unit file>` - The following command shows the resources a service unit will depend on or the resource units that will depend on this service in recursive manner.

* `systemctl --failed` - units that failed to load or activate, they’ll be listed here.

* If you suspect a particular service failed, you can use the is-failed parameter with systemctl. Taking the example of apache2.service, if we execute the following command:
	* `systemctl is-failed apache2.service`

* `systemctl enable specific.service` - this will make specific service start at boot.

---

* `systemd-analyze` - systemd-analyze can provide valuable information about total time taken by the boot process. 
* `systemd-analyze blame` - it will give detailed time how long it took for a each service to start. This can be a valuable tool to consider if your server is taking a long time to boot and you’re not sure what the cause is.