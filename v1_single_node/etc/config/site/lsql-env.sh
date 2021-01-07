#!/usr/bin/env bash

export CL_HADOOP_CONF_DIR=/opt/software/hadoop/etc/hadoop
export CL_HADOOP_HOME=/opt/software/hadoop
export CL_JAVA_HOME=/opt/software/zgc

export CL_HADOOP_CLASS_PATH=`${CL_HADOOP_HOME}/bin/hadoop classpath`

export CL_HDFS_PATH=/data

export CL_DRIVER_MEMORY=28000m
export CL_EXECUTOR_COUNT=4
export CL_EXECUTOR_MEMORY=50000m
export CL_EXECUTOR_CORES=24
export CL_EXECUTOR_PARTITIONS=2

export CL_HDFS_USER=root

export CL_SERVER_ROLE=primary

export CL_ZGC_SUPPORT=true


