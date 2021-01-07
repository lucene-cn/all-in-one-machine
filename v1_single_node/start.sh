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
sh ${LX_HOME_DIR}/____clean.sh
sh ${LX_HOME_DIR}/____links.sh
sh ${LX_HOME_DIR}/____sys.sh
sh ${LX_HOME_DIR}/____crontab.sh
#start zookeepr
echo "start zookeepr"
echo "zookeepr"
 export LX_TMP_JAVA_HOME=${JAVA_HOME}
 export JAVA_HOME=/opt/software/jdk
sh /opt/software/zookeeper/bin/zkServer.sh start
 export JAVA_HOME=${LX_TMP_JAVA_HOME}

#start hadoop
echo "start hadoop"
echo "namenode"
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  start namenode 
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  start secondarynamenode 

sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  start datanode 
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop2  start datanode 
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop3  start datanode
sh /opt/software/hadoop/sbin/hadoop-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop4  start datanode 

sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  start resourcemanager 
sh /opt/software/hadoop/sbin/yarn-daemon.sh --config ${LX_HOME_DIR}/etc/hadoop  start nodemanager 



#wait safemode leave
for i in $( seq 1 3600 )
do

safemode_count=$(eval "/opt/software/hadoop/bin/hdfs dfsadmin -safemode get|grep OFF|wc -l")
if [ $safemode_count -lt "1" ]; then
    echo " safemode wait ${safemode_count} @ $i"
    sleep 10 
else
    echo " safemode ok ${safemode_count}"
    break
fi

done

#start kafka
echo "start kafka"
 export KAFKA_HEAP_OPTS="-Xmx10G -Xms10G"
 export LX_TMP_JAVA_HOME=${JAVA_HOME}
  export JAVA_HOME=/opt/software/jdk
 sh /opt/software/kafka/bin/kafka-server-start.sh -daemon ${LX_HOME_DIR}/etc/kafka/server.properties
 export JAVA_HOME=${LX_TMP_JAVA_HOME}



#hdfs config
/opt/software/hadoop/bin/hdfs dfs -mkdir -p /data/ssdindex >> /dev/null 2>&1
/opt/software/hadoop/bin/hdfs storagepolicies -setStoragePolicy -path /data/ssdindex -policy One_SSD 


#/opt/software/hadoop/bin/hdfs dfs -mkdir -p /data/ssdindex2 >> /dev/null 2>&1
#/opt/software/hadoop/bin/hdfs storagepolicies -setStoragePolicy -path /data/ssdindex2 -policy One_SSD 



#/opt/software/hadoop/bin/hdfs dfs -mkdir -p /data/ssdindex3 >> /dev/null 2>&1
#/opt/software/hadoop/bin/hdfs storagepolicies -setStoragePolicy -path /data/ssdindex3 -policy One_SSD 



#start lsql
echo "start lsql"

sh /opt/software/lsql/sbin/restart.sh
echo "start test"

#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &
#sh /opt/software/lsql/test/a.sh >/dev/null &


echo "start finish"


##start tomcat and demo
sh /opt/software/apache-tomcat-8.5.51/bin/startup.sh
cd  /opt/software/demo
java -jar /opt/software/demo/demotest.jar &

#mkdir -p /logs/setup
#sh  /opt/software/lx/start.sh >>/logs/setup/initstart


