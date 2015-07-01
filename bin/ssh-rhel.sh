STACK_NAME="$1"
ssh -A -t ec2-user@jumphost.sandbox.us-west-2.nubis.allizom.org "ssh -A -t ec2-user@$(nubis-consul --stack-name $STACK_NAME --settings nubis/cloudformation/parameters.json get-ec2-instance-ip)"
