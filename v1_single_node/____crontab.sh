#!/usr/bin/env bash


#这里移动crontab文件到crontab目录
if  [ ! -f /var/spool/cron/cleanlogs.cron ] ; then
  cp $LX_HOME_DIR/etc/sys/cleanlogs.cron /var/spool/cron/cleanlogs.cron
  systemctl  reload crond 
fi 
if  [ ! -f /var/spool/cron/root ] ; then
  cp $LX_HOME_DIR/etc/sys/root /var/spool/cron/root
  systemctl  reload crond 
fi