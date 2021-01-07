#!/usr/bin/env bash
source /etc/profile
if [ -f /root/.bashrc ]; then
    source /root/.bashrc
else
    if [ -f ~/.bashrc ]; then
        source ~/.bashrc
    fi
fi
export LX_HOME_DIR="$(cd "`dirname "$0"`"/; pwd)"

sh ${LX_HOME_DIR}/____mkdir.sh
#sh ${LX_HOME_DIR}/____clean.sh
sh ${LX_HOME_DIR}/____links.sh
sh ${LX_HOME_DIR}/____sys.sh
sh ${LX_HOME_DIR}/____crontab.sh
sh ${LX_HOME_DIR}/____config_zk_kafka_hadoop.sh
#setup limits centos7
cat /etc/systemd/system.conf > /data/logs/setup/system.conf
cat ${LX_HOME_DIR}/etc/sys/system.conf > /etc/systemd/system.conf

#setup /env/env
cat ~/.bashrc >  /data/logs/setup/bashrc
cat ${LX_HOME_DIR}/etc/sys/bashrc > ~/.bashrc



chmod a+x ${LX_HOME_DIR}/*.sh

cat  ${LX_HOME_DIR}/startall.service > /etc/rc.d/init.d/startall.service
chmod a+x  /etc/rc.d/init.d/startall.service
chkconfig --add /etc/rc.d/init.d/startall.service
chkconfig startall.service on

if [ ! -f "/usr/lib/systemd/system/stopSer.service" ];then
cp ${LX_HOME_DIR}/etc/sys/stopSer.service /usr/lib/systemd/system/
systemctl enable stopSer.service
fi