STACK_NAME="$1"
watch -n 1 "echo 'Container Stack'; aws cloudformation describe-stacks --query 'Stacks[*].[StackName, StackStatus]' --output text --stack-name $STACK_NAME; echo \"\nNested Stacks\"; aws cloudformation describe-stack-resources --stack-name $STACK_NAME --query 'StackResources[*].[LogicalResourceId, ResourceStatus]' --output text"
