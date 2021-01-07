#!/usr/bin/env bash
. /etc/profile
. ~/.bashrc
export CL_HOME_DIR="$(cd "`dirname "$0"`"/..; pwd)"
source ${CL_HOME_DIR}/sbin/load-config.sh
 

for r in $(seq $1)
do 

for c in $(seq $2)
do 

echo -n $[$RANDOM%32]","

done
echo ""
done