# nubis-openldap

Deploys an openldap master

## Quick start
0. Set up the [Prerequisites](https://github.com/Nubisproject/nubis-docs/blob/master/PREREQUISITES.md)
0. `git clone git@github.com:nubisproject/nubis-skel.git`
0. `nubis-builder build`
0. Edit the nubis/cloudformation/parameters.json [file](nubis/cloudformation/README.md#set-up)
0. Deploy the stack using the [aws cli tools](nubis/cloudformation/README.md#create).

## Setting up ENI
#### Reserving IP addresses

1. Find out what available the subnet ID translates to and what the IP ranges are

    ```bash
    aws ec2 describe-subnets --region us-east-1 --filter Name=tag-key,Values=Name Name=tag-value,Values=PrivateSubnet* --query 'sort_by(Subnets, &AvailabilityZone)[*][Tags[?Key == `Name`].Value | [0], Tags[?Key == `Environment`].Value | [0], CidrBlock, SubnetId, AvailabilityZone]' --output text
    ```

2. Figure out what IP has been taken so we can safely allocate them

    ```bash
    aws ec2 describe-network-interfaces --region us-east-1 --query 'sort_by(NetworkInterfaces, &PrivateIpAddress)[?Status == `in-use`][PrivateIpAddress]' --output text
    ```

3. Input them into your `parameters.json` file
