#!/bin/bash
who
last -a | head -n 5
# cronjobs
crontab -l
ls /etc/cron* -R
systemctl list-timers --all
# listen ports
ss -tulnp
# running proc
ps aux --sort=-%mem | head
# recent file changes
find /etc -type f -mtime -2
# reboot history
uptime
last reboot | head -n 3
# sudo anomalies
getent passwd | grep '/home'
getent group sudo
