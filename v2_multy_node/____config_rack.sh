#!/bin/bash
LX_HOME_DIR="$(cd "`dirname "$0"`"/; pwd)"
SERVERLIST=$LX_HOME_DIR/serverlist
for ip in  $@ ; do
  rackname="/rack-default"
  while read server 
  do
    rip=`echo $server | awk -F " " '{print $1}'`
    hostname=`echo $server | awk -F " " '{print $2}'`
    id=`echo $server | awk -F " " '{print $3}'`
    if [ -z $rip ]; then 
        rackname="/rack-default"
    else
        if [ $rip = $ip ] ; then
            rackname="/rack-"$id
            break
        else
            rackname="/rack-default"
        fi        
    fi
    
  done < $SERVERLIST
  echo $rackname
done
