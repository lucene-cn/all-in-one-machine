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


#stop lsql
export LX_TMP_JAVA_HOME=${JAVA_HOME}
echo "stop lsql"

sh /opt/software/lsql/sbin/stop.sh

export JAVA_HOME=/opt/software/jdk

#stop kafka
echo "stop kafka"
export JAVA_HOME=/opt/software/jdk
KFAKA_PID=`jps |grep Kafka | awk '{print $1}'`
kill -9 $KFAKA_PID

#stop zookeepr
echo "stop zookeepr"
echo "zookeepr"
sh /opt/software/zookeeper/bin/zkServer.sh stop
 export JAVA_HOME=${LX_TMP_JAVA_HOME}

#stop hadoop
echo "stop hadoop"
sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop resourcemanager
sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop nodemanager
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop namenode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop secondarynamenode

sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop2  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop3  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop4  stop datanode



ps -ef | grep demotest.jar | grep -v grep | awk  '{ print $2 }' | xargs kill -9 
