#!/bin/bash
aws ec2 describe-instances --filters Name=instance-state-name,Values=running --filters Name=tag:environment,Values=$1 --query "Reservations[*].Instances[*].InstanceId" --output text
