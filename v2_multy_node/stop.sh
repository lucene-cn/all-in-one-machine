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
. $LX_HOME_DIR/params.sh

#stop lsql
export LX_TMP_JAVA_HOME=${JAVA_HOME}

if [ $IS_START_LSQL = "yes" ] ; then
    echo "stop lsql"
    sh /opt/software/lsql/sbin/stop.sh
fi
export JAVA_HOME=/opt/software/jdk

#stop kafka
if [ $IS_START_KAFKA = "yes" ] ; then
    echo "stop kafka"
    export JAVA_HOME=/opt/software/jdk
    KFAKA_PID=`jps |grep Kafka | awk '{print $1}'`
    kill -9 $KFAKA_PID
fi
#stop zookeepr
if [ $IS_START_ZK = "yes" ] ; then
    echo "stop zookeepr"
    echo "zookeepr"
	export JAVA_HOME=/opt/software/jdk
    sh /opt/software/zookeeper/bin/zkServer.sh stop
fi
 export JAVA_HOME=${LX_TMP_JAVA_HOME}

#stop hadoop
echo "stop hadoop"
if [ $IS_START_RM = "yes" ] ; then
    sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop resourcemanager
fi
sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop nodemanager
if [ $IS_START_NN = "yes" ] ; then
    sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop namenode
    sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop secondarynamenode
fi

sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop2  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop3  stop datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop4  stop datanode



ps -ef | grep demotest.jar | grep -v grep | awk  '{ print $2 }' | xargs kill -9 
