#! /bin/bash
hostname=$1
echo $(ifconfig | grep -A 1 'eth1' | tail -1 | sed -e 's/^[ \t]*//' | cut -d ':' -f 2 | cut -d ' ' -f 2) $hostname &>> /vagrant/host_file