#!/bin/env bash
#每一台一体机需要一个唯一的id，与serverlistl里面对应
export THIS_SERVER_ID=1

export NN_HOST= #namenode host,应该与serverlist里面的ip对应
export RM_HOST= #resourcemanager host,应该与serverlist里面的ip对应
export SNM_HOST= #secondarynamenode host,应该与serverlist里面的ip对应
#机架策略，机架名
export IS_START_NN=yes #yes or no,是否启动namenode
export IS_START_RM=yes #yes or no,是否启动resourcemanager
export IS_START_ZK=yes #yes or no,是否启动zk
export IS_START_KAFKA=yes #yes or no,是否启动kafka
export IS_START_LSQL=yes #yes or no,是否启动kafka