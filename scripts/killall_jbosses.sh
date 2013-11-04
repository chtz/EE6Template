#!/bin/bash
SCRIPT_DIR=`dirname $0`
INSTANCE_ID_LIST=`$SCRIPT_DIR/list_running_jbosses_instanceid.sh $1`
for INSTANCE_ID in ${INSTANCE_ID_LIST//\\n/ }
do
	aws ec2 terminate-instances --instance-ids $INSTANCE_ID
done
