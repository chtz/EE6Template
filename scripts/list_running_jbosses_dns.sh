#!/bin/bash
aws ec2 describe-instances --filters Name=instance-state-name,Values=running --filters Name=tag:environment,Values=demoStack1 --query "Reservations[*].Instances[*].PublicDnsName" --output text
