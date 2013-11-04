#!/bin/bash
SCRIPT_DIR=`dirname $0`
DNS_LIST=`$SCRIPT_DIR/list_running_jbosses_dns.sh`
for DNS in ${DNS_LIST//\\n/ }
do
	scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $1 ec2-user@$DNS:~/
	ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ec2-user@$DNS mv `basename $1` jboss-as-7.1.1.Final/standalone/deployments/ROOT.war
done
