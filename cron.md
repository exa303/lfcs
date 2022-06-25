### Cron

* `crontab -l` - To list all the scheduled cron jobs for the current user, run the following command. It’ll print all the contents of the crontab file.

* `sudo crontab -u <username> -l` - cron job list for a different user.

* `crontab -e` - edit the crontab script

**Script fields**

```

    m - minute: 0 to 59
    h - hours: 0 to 23
   	dom - day of the month: 1 to 31
    mom - month: 1 to 12
    dow - day of the week: 0 (Sunday) to 6 (Saturday)


```
