#!/usr/bin/env bash

rm -rf /opt/software/hadoop/etc/hadoop
ln -s ${LX_HOME_DIR}/etc/hadoop /opt/software/hadoop/etc/hadoop


#links zookeeper

echo "01" >/data/zk/myid

rm -rf  /opt/software/zookeeper/conf
ln -s ${LX_HOME_DIR}/etc/zookeeper /opt/software/zookeeper/conf

#links kafka


rm -rf  /opt/software/kafka/config
ln -s ${LX_HOME_DIR}/etc/kafka /opt/software/kafka/config

rm -rf  /opt/software/kafka/logs
ln -s /data/logs/kafka /opt/software/kafka/logs


#links lsql
rm -rf /opt/software/lsql/logs
ln -s /data/logs/lsql_logs /opt/software/lsql/logs

rm -rf /opt/software/lsql/config
ln -s ${LX_HOME_DIR}/etc/config /opt/software/lsql/config


rm -rf /opt/software/lsql/tmp
ln -s /data/logs/lsql/tmp /opt/software/lsql/tmp

rm -rf /opt/software/lsql/metastore
ln -s /data/logs/lsql/metastore /opt/software/lsql/metastore

rm -rf /opt/software/lsql/pid
ln -s  /data/logs/lsql/pid /opt/software/lsql/pid
