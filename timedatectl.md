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
