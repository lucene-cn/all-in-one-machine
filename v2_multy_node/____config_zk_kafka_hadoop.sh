#!/bin/env bash
set -x
function errorEcho(){
  echo -e "\033[41;37m $1 \033[0m"
}
#export LX_HOME_DIR="$(cd "`dirname "$0"`"/; pwd)"
SERVERLIST=$LX_HOME_DIR/serverlist
. $LX_HOME_DIR/params.sh
##zookeeper config
################################################################################################################
while read server 
 do
  if [ -n $sever ] ; then
    ip=`echo $server | awk -F " " '{print $1}'`
    hostname=`echo $server | awk -F " " '{print $2}'`
    id=`echo $server | awk -F " " '{print $3}'`
    this_cnt=`cat $LX_HOME_DIR/etc/zookeeper/zoo.cfg | grep $hostname | wc -l`
    if [ $this_cnt -eq 0 ] && [ $id"0" != "0"$id ] && [ $id -lt 6 ]; then      
      echo "server.$id=$hostname:2888:3888" >> $LX_HOME_DIR/etc/zookeeper/zoo.cfg
    fi
  fi
done < $SERVERLIST

echo "$THIS_SERVER_ID" > /data/zk/myid
################################################################################################################
#config log dir
#-----------------
sed -i "2,2s#.*#export ZOO_LOG_DIR=/data/logs/zklogs\; export ZOO_LOG4J_PROP=INFO,ROLLINGFILE#g" $LX_HOME_DIR/..//zookeeper/bin/zkServer.sh
#-----------------

##config broker.id
sed -i "s/broker.id=.*/broker.id=$THIS_SERVER_ID/g" $LX_HOME_DIR/etc/kafka/server.properties
##config zookeeper.connect=zk1.lucene.cn:2181
zkconn=""
while read server 
 do
   if [ -n $sever ] ; then
    ip=`echo $server | awk -F " " '{print $1}'`
    hostname=`echo $server | awk -F " " '{print $2}'`
    id=`echo $server | awk -F " " '{print $3}'`
    if [ $this_cnt -lt 6 ] && [ $id"0" != "0"$id ] ; then      
      zkconn=$zkconn"$hostname:2181,";
    fi
  fi
done < $SERVERLIST
zkconn=${zkconn%,*}
sed -i "s/zookeeper.connect=.*/zookeeper.connect=$zkconn/g" $LX_HOME_DIR/etc/kafka/server.properties

#################################################################################################################
##config hadoop[ namenode host,resourcemanager host,secondarynamenode host]

if [ -z $NN_HOST ] ; then
  errorEcho "#######namenode的hostname为空，设置错误。"
else
  sed -i "s/namenodeplaceholder/$NN_HOST/g" $LX_HOME_DIR/etc/hadoop/core-site.xml
  sed -i "s/namenodeplaceholder/$NN_HOST/g" $LX_HOME_DIR/etc/hadoop2/core-site.xml 
  sed -i "s/namenodeplaceholder/$NN_HOST/g" $LX_HOME_DIR/etc/hadoop3/core-site.xml 
  sed -i "s/namenodeplaceholder/$NN_HOST/g" $LX_HOME_DIR/etc/hadoop4/core-site.xml  
fi


if [ -z $SNM_HOST ] ; then
  errorEcho "#######secondarynamenode的hostname为空，设置错误。"
else
  sed -i "s/secondarynamenodeplaceholder/$SNM_HOST/g" $LX_HOME_DIR/etc/hadoop/hdfs-site.xml
  sed -i "s/secondarynamenodeplaceholder/$SNM_HOST/g" $LX_HOME_DIR/etc/hadoop2/hdfs-site.xml
  sed -i "s/secondarynamenodeplaceholder/$SNM_HOST/g" $LX_HOME_DIR/etc/hadoop3/hdfs-site.xml
  sed -i "s/secondarynamenodeplaceholder/$SNM_HOST/g" $LX_HOME_DIR/etc/hadoop4/hdfs-site.xml
fi

if [ -z $RM_HOST ] ; then
  errorEcho "#######resourcemanager的hostname为空，设置错误。"
else
  sed -i "s/resourcemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop/yarn-site.xml
  sed -i "s/resourcemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop2/yarn-site.xml
  sed -i "s/resourcemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop3/yarn-site.xml
  sed -i "s/resourcemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop4/yarn-site.xml
fi

while read server 
 do
  if [ -n $sever ] ; then
    ip=`echo $server | awk -F " " '{print $1}'`
    hostname=`echo $server | awk -F " " '{print $2}'`
    id=`echo $server | awk -F " " '{print $3}'`
    if [ $id"0" != "0"$id ] && [  $id -eq $THIS_SERVER_ID ] ; then      
      #sed -i "s/nodemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop/yarn-site.xml
      #sed -i "s/nodemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop2/yarn-site.xml
      #sed -i "s/nodemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop3/yarn-site.xml
      #sed -i "s/nodemanagerplaceholder/$RM_HOST/g" $LX_HOME_DIR/etc/hadoop4/yarn-site.xml
      ########################
      sed -i "s/datanodeplaceholder/$hostname/g" $LX_HOME_DIR/etc/hadoop/hdfs-site.xml
      sed -i "s/datanodeplaceholder/$hostname/g" $LX_HOME_DIR/etc/hadoop2/hdfs-site.xml
      sed -i "s/datanodeplaceholder/$hostname/g" $LX_HOME_DIR/etc/hadoop3/hdfs-site.xml
      sed -i "s/datanodeplaceholder/$hostname/g" $LX_HOME_DIR/etc/hadoop4/hdfs-site.xml
    fi
  fi
done < $SERVERLIST

