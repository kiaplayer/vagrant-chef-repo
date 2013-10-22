#!/bin/bash

host="$1"
if [ "$host" = "" ];
then
    echo "Usage: $0 user@host ssh-params"
    exit 1
fi

node=${host#*@}

# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
ssh-keygen -R "$node" 2> /dev/null

tar cj . | ssh -o 'StrictHostKeyChecking no' $@ "
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash ./install.sh $node"
