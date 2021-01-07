#!/bin/env bash

####################################################################
export NAMENODE_IPHOSTS(IP,HOST)
export REMANAGER_IPHOSTS(ip,host)
####################################################################
#default 默认四个datanode全部启用                                    
export HD1_USE_FLAG="true"                                           
export HD2_USE_FLAG="true"                                           
export HD3_USE_FLAG="true"                                           
export HD4_USE_FLAG="true"                                           
####################################################################
#default 根据datanode的使用和磁盘路径修改.                          
#多个路径以逗号分隔                                                 
export HD1_DATANODE_DIR=(dir,SATA)                                            
export HD1_NAMENODE_DIR=                                            
export HD1_NAMENODE_CHECKPOINT_DIR=                                 
                                                                    
export HD2_DATANODE_DIR=(dir,SATA)                                            
export HD2_NAMENODE_DIR=                                            
export HD2_NAMENODE_CHECKPOINT_DIR=                                 
                                                                    
export HD3_DATANODE_DIR=(dir,SATA)                                            
export HD3_NAMENODE_DIR=                                            
export HD3_NAMENODE_CHECKPOINT_DIR=                                 
                                                                    
export HD4_DATANODE_DIR=(dir,SATA)                                            
export HD4_NAMENODE_DIR=                                            
export HD4_NAMENODE_CHECKPOINT_DIR=                                 
####################################################################
#kafka hadoop zk lsql等日志目录
export ALL_LOGS_DIR=

export HD_TMP_DIR=""
#创建所有的目录
if [ -n HD1_DATANODE_DIR -a  HD1_USE_FLAG="true" ] ; then 
    mkdir -p ${HD1_DATANODE_DIR}/hdfsdata/tmp
else
    echo "HD1_USE_FLAG="" 未配置目录，tmp文件夹未生成。"
fi


