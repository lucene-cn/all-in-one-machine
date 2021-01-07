#!/usr/bin/env bash

HOSTNAME="node1.lucene.cn"
IP=""
export LX_HOME_DIR="$(cd "`dirname "$0"`"/; pwd)"

. $LX_HOME_DIR/params.sh

#setup limits   centos6
cat /etc/security/limits.conf >  /data/logs/setup/limits.conf
cat ${LX_HOME_DIR}/etc/sys/limits.conf > /etc/security/limits.conf

cat /etc/security/limits.conf 
sed -i 's/1024/unlimited/' /etc/security/limits.d/20-nproc.conf
sed -i 's/4096/unlimited/' /etc/security/limits.d/20-nproc.conf

cat /etc/security/limits.d/20-nproc.conf
ulimit -SHn 1000000
ulimit -a




#setup system env
echo never > /sys/kernel/mm/transparent_hugepage/defrag 
echo never > /sys/kernel/mm/transparent_hugepage/enabled
cat /proc/cpuinfo |grep MHz



swapoff -a

echo 150000 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

sysctl -w vm.nr_hugepages=150000

echo 1000000 > /proc/sys/vm/max_map_count
sysctl -w vm.max_map_count=1000000


if [ ! -f "/etc/sysctl.bak.conf" ];then

mv /etc/sysctl.conf /etc/sysctl.bak.conf
cat<<EOF >/etc/sysctl.conf
net.core.somaxconn=32768
vm.swappiness=1
vm.nr_hugepages=150000
vm.max_map_count=1000000
EOF

fi

sysctl -p
sysctl -a


mkdir -p /hugepages
mount -t hugetlbfs -o uid=123 nodev /hugepages 

echo "max_map_count"


#setup /etc/hosts
cat /etc/hosts >  /data/logs/setup/hosts
cat ${LX_HOME_DIR}/etc/sys/hosts >/etc/hosts

while read  server
 do
   if [ -n "$server" ] ; then
    ip=`echo $server | awk -F " " '{print $1}'`
    hostname=`echo $server | awk -F " " '{print $2}'`
	id=`echo $server | awk -F " " '{print $3}'`
    this_cnt=`cat /etc/hosts | grep $hostname | wc -l`
    echo "$ip $hostname" >> /etc/hosts
	if [ $id -eq $THIS_SERVER_ID ]; then
	  HOSTNAME=$hostname
	  IP=$ip
	fi
  fi
done < ${LX_HOME_DIR}/serverlist

#############################################################################################
#配置主机名

if [ -n ${IP} ] ; then
  hostname $HOSTNAME
  hostnamectl set-hostname $HOSTNAME
  echo ${HOSTNAME} > /etc/hostname
fi
if [ $IS_START_NN = "yes" ] ; then
  hostname $NM_HOST
  hostnamectl set-hostname $NM_HOST
  echo ${NN_HOST} > /etc/hostname
fi
###############################################################################################
#节能模式
#tuned-adm profile throughput-performance
#cpupower frequency-set -g performance


#2020-02-11 16:38 lqs
#setup somaxconn
sysctl -w net.core.somaxconn=32768
sysctl -p

#关闭防火墙
systemctl stop firewalld
systemctl disable firewalld.service

#配置setenforce与umask
setenforce 0
sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/langpacks.conf
umask 0022
num=`grep -w -c "umask 0022" /etc/profile`
if [ $num -eq 0 ]
then
    echo "umask 0022" >> /etc/profile
fi

#du命令替换

if [ ! -f "/usr/bin/duraw" ];then

mv /usr/bin/du /usr/bin/duraw
cat<<EOF >/usr/bin/du
#!/usr/bin/env bash
mydf=\$(df -Pk \$2 |grep -vE '^Filesystem|tmpfs|cdrom'|awk '{ print \$3 } ' )
echo -e "\$mydf\t\$2"
EOF

fi

chmod a+x /usr/bin/du
