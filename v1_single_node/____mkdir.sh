#!/usr/bin/env bash

#prepare hadoop
mkdir -p /data/sata1/hdfsdata/tmp

mkdir -p /data/logs/hadoop_executor
mkdir -p /data/logs/hadoop_local_dir
mkdir -p /data/logs/hadoop_log1
mkdir -p /data/logs/hadoop_log2
mkdir -p /data/logs/hadoop_log3
mkdir -p /data/logs/hadoop_log4

mkdir -p /data/sata1/hdfsdata/yarnlogs
mkdir -p /data/sata2/hdfsdata/yarnlogs
mkdir -p /data/sata3/hdfsdata/yarnlogs
mkdir -p /data/sata4/hdfsdata/yarnlogs

mkdir -p /data/sata1/hdfsdata/userlogs
mkdir -p /data/sata2/hdfsdata/userlogs
mkdir -p /data/sata3/hdfsdata/userlogs
mkdir -p /data/sata4/hdfsdata/userlogs

mkdir -p /data/ssd1/hdfsdata/data
mkdir -p /data/ssd2/hdfsdata/data
mkdir -p /data/sata1/hdfsdata/data
mkdir -p /data/sata2/hdfsdata/data
mkdir -p /data/sata3/hdfsdata/data
mkdir -p /data/sata4/hdfsdata/data

mkdir -p /var/lib/hadoop-hdfs

mkdir -p /data/sata1/hdfsdata/namenode
mkdir -p /data/sata2/hdfsdata/namenode
mkdir -p /data/sata3/hdfsdata/namenode
mkdir -p /data/sata4/hdfsdata/namenode

mkdir -p /data/logs/hadoop_pid1
mkdir -p /data/logs/hadoop_pid2
mkdir -p /data/logs/hadoop_pid3
mkdir -p /data/logs/hadoop_pid4

#prepare zookeeper
mkdir -p /data/zk

#prepare kafka
mkdir -p /data/sata1/kafkalogs
mkdir -p /data/sata2/kafkalogs
mkdir -p /data/sata3/kafkalogs
mkdir -p /data/sata4/kafkalogs
mkdir -p /data/logs/kafka


#prepare lsql
mkdir -p /data/logs/lsql_logs
mkdir -p /data/logs/lsql/tmp
mkdir -p /data/logs/lsql/metastore
mkdir -p /data/logs/lsql/pid
#prepare other
mkdir -p /data/logs/setup
mkdir -p /data/logs/ssd

echo "mkdir finish"

rm -f /opt/software/hadoop/share/hadoop/hdfs/hadoop-hdfs-2.8.5.jar
cp ${LX_HOME_DIR}/patch/hadoop-hdfs-2.8.5.jar /opt/software/hadoop/share/hadoop/hdfs/


rm -rf /opt/software/lsql/test
cp -rf ${LX_HOME_DIR}/test  /opt/software/lsql/test


