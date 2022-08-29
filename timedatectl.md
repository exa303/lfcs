## Set time and date using timedatectl

* `timedatectl set-time '2015-11-23 08:10:40'`

## Usind date

* `date +%T -s "10:13:13"`

## Set time zone

* `timedatectl list-timezones` grep the needed and set it `timedatectl set-timezone <x>`

## Synchronize with ntp
* first install systemd-timesyncd service:
    *   `apt-get install systemd-timesyncd`
    *   `systemctl enable/start systemd-timesyncd`
*  set ntp:
    * `timedatectl set-ntp yes`



# Install ntp server manualy

sudo apt-get install ntp


1. 
2. 
3. Add reference clock peers to the configuration file.
4. Add drift file location to the configuration file .
5. Add optional statistics directory to the configuration file .
6. Enable and start the NTP service.
7. Check operation and synchronization status.


### Install the NTP service.
```bash
  sudo apt-get install ntp  # for Debian/Ubuntu
  sudo yum install ntp      # for CentOS/RHEL
  sudo dnf install ntp      # for Fedora
```

### Modify the NTP configuration file, ‘/etc/ntp.conf’, with required options.
NTP relies on reference clock servers, or peers, in order to synchronize the local system clock. One or more peers can be added to the configuration file, as follows:

`server <address> [prefer]`

The address operand is a domain name or IP address of a NTP server to be used for synchronization.

The ‘prefer’ option may be used to specify a preferred peer. All things being equal, a preferred peer will be selected by NTP from a list of similarly performing peers. The prefer option should only be specified once.

It is also considered best practice to specify an odd number of peers. A time offset that is out of tolerance in any one peer can then be easily detected. The peer can then be discarded by the selection algorithm.

### Add drift file location to the configuration file 

NTP uses a drift file to store the frequency offset of the local clock oscillator. The frequency offset is stored in parts-per-million (PPM). The file is updated by the NTP service every hour. It is considered good practice to specify a drift file, since it allows NTP to synchronize the local clock faster on start up. A drift file is specified as follows:

`driftfile /var/lib/ntp/ntp.drift.`

### Specifying Statistics File Directory:

You can use the statsdir command in the configuration file to specify a directory where statistics files will be stored. Statistics files are useful to view local clock synchronization performance.

`statsdir <directory_path>`


### Example NTP Configuration File
As a minimum a configuration file needs to specify a server that should be used for synchronization along with a drift file to store local clock frequency.
```bash
  server pool.ntp.org         # NTP pool project world-wide servers
  driftfile /var/lib/ntp/ntp.drift.
```

However, a more complete configuration file will include multiple servers, drift file and a statics directory:
```bash
  server 192.168.1.127 prefer # Local NTP server IP address
  server pool.ntp.org         # NTP pool project world-wide servers
  server time-a-g.nist.gov    # NIST internet time service
  driftfile /var/lib/ntp/ntp.drift.
  statsdir directory_path
```


