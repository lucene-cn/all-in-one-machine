#!/bin/env bash
source /etc/profile
if [ -f /root/.bashrc ]; then
    source /root/.bashrc
else
        if [ -f ~/.bashrc ]; then
                source ~/.bashrc
        fi
fi

find /data/logs/hadoop_log1 -mtime +7 -name "*.log" -exec rm -rf {} \;
find /data/logs/hadoop_log1 -mtime +7 -name "*.log.*" -exec rm -rf {} \;
find /data/logs/hadoop_log1 -mtime +7 -name "*.out" -exec rm -rf {} \;
find /data/logs/hadoop_log1 -mtime +7 -name "*.out.*" -exec rm -rf {} \;

find /data/logs/hadoop_log2 -mtime +7 -name "*.log" -exec rm -rf {} \;
find /data/logs/hadoop_log2 -mtime +7 -name "*.log.*" -exec rm -rf {} \;
find /data/logs/hadoop_log2 -mtime +7 -name "*.out" -exec rm -rf {} \;
find /data/logs/hadoop_log2 -mtime +7 -name "*.out.*" -exec rm -rf {} \;

find /data/logs/hadoop_log3 -mtime +7 -name "*.log" -exec rm -rf {} \;
find /data/logs/hadoop_log3 -mtime +7 -name "*.log.*" -exec rm -rf {} \;
find /data/logs/hadoop_log3 -mtime +7 -name "*.out" -exec rm -rf {} \;
find /data/logs/hadoop_log3 -mtime +7 -name "*.out.*" -exec rm -rf {} \;

find /data/logs/hadoop_log4 -mtime +7 -name "*.log" -exec rm -rf {} \;
find /data/logs/hadoop_log4 -mtime +7 -name "*.log.*" -exec rm -rf {} \;
find /data/logs/hadoop_log4 -mtime +7 -name "*.out" -exec rm -rf {} \;
find /data/logs/hadoop_log4 -mtime +7 -name "*.out.*" -exec rm -rf {} \;

find /data/logs/kafka -mtime +7 -name "*.log" -exec rm -rf {} \;
find /data/logs/kafka -mtime +7 -name "*.log.*" -exec rm -rf {} \;
