# Synchronize time using other network peers


Your Linux system will generally have two clocks, a hardware clock/real time clock (RTC) and a system clock.

The hardware clock is physically present and continues to run from battery power even if the system is not plugged into a power source, this is how the time stays in place when there is no power available. As the Linux system boots up it will read time from the hardware clock, this initial time is then passed to the system clock.

The system clock runs in the kernel and after getting its initial time from the hardware clock it will then synchronize with an NTP server to become up to date.

* `hwclock` -  display the current time of the hardware clock.
* `date` - date command can be used to view system time.

* `hwclock --hctosys` - We can manually synchronize the hardware clock to the system clock if required, this would generally only be required if there was no NTP server available.

* `hwclock --systohc` - We can also reverse the process and synchronize the system clock to the hardware clock.

* `timedatectl` - informtaion about system.

## Understanding Stratum

NTP servers work based on a layered hierarchy referred to as stratum, starting at stratum 0. Stratum 0 are the highly exact time sources such as atomic clocks or GPS clocks, these are our reference time devices. Stratum 1 are the computers that synchronize with the stratum 0 sources, these are highly accurate NTP servers. Stratum 2 servers then get their time from the stratum 1 servers, while stratum 3 servers synchronize with stratum 2 sources.

Essentially stratum n+1 will synchronize against stratum n, the highest limit is 15, while 16 refers to a device that is not synchronized. There are plenty of publicly available stratum 1 servers available on the Internet for use. It is generally recommended that you synchronize with a time source higher in the hierarchy, for instance synchronizing time against a stratum 1 server will be considered more reliable than using a stratum 4 server.

## Firewall Rules

By default NTP uses UDP port 123, so if you are connecting over the Internet to an external NTP server ensure that outbound UDP 123 traffic is allowed out to the NTP server specified in your configuration. Normally by default all outbound traffic is allowed so this should not be a problem. Public NTP servers on the Internet should already be configured to accept inbound NTP traffic.

**The timedatectl command can also be used to enable and disable NTP with set-ntp, it will enable or disable either chronyd or ntpd depending on the service that is in use. In the example below we disable NTP and then enable it again which also triggers it to synchronize with the NTP servers.**

```
[root@centos7 ~]# timedatectl set-ntp 0
[root@centos7 ~]# timedatectl | grep NTP
     NTP enabled: no
     NTP synchronized: no

[root@centos7 ~]# timedatectl set-ntp 1
[root@centos7 ~]# timedatectl
     NTP enabled: yes
     NTP synchronized: yes

```


## NTPD
By default it is not installed in CentOS 7 or other distro, so you will first need to install it. 
`sudo apt-get install ntp`

* `systemctl enable ntp` - make sure that the ntpd service starts up automatically on boot so that we can maintain accurate time.
* `systemctl start ntp`  - start the service. Don't forget to disable `systemd-timesyncd.service` with `timedatectl set-ntp 0` before you start ntp server.

The configuration for ntpd is stored in the `/etc/ntp.conf` file.

### Management
With ntpd we can perform various management tasks. The ntpq command allows us to query and monitor the NTP daemon, ntpd. For instance we can view information about known NTP peers with `ntpd -p`.




