#!/bin/bash
DNS_LIST="`aws ec2 describe-instances --filters Name=instance-state-name,Values=running --filters Name=tag:environment,Values=demoStack1 --query "Reservations[*].Instances[*].PublicDnsName" --output text`"
for DNS in ${DNS_LIST//\\n/ }
do
	scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $1 ec2-user@$DNS:~/
	ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ec2-user@$DNS mv `basename $1` jboss-as-7.1.1.Final/standalone/deployments/ROOT.war
done
