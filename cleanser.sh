#!/usr/bin/bash

#
#
# Script to remove out chunter, and zlogin from a gz
# 
# WARNING
# There are plenty of ways this could go wrong!
#
# Run with:
# curl -k https://raw.githubusercontent.com/jptac/cleanser/master/cleanser.sh | /bin/sh
#

cd /opt/
rm -rf *
svcadm disable chunter
svcadm disable zlogin
svcadm disable empd


for pid in $(ps -ef | awk '/chunter/ {print $2}'); do kill -9 $pid; done
for pid in $(ps -ef | awk '/zlogin/ {print $2}'); do kill -9 $pid; done
for pid in $(ps -ef | awk '/empd/ {print $2}'); do kill -9 $pid; done
for pid in $(ps -ef | awk '/erlang/ {print $2}'); do kill -9 $pid; done

svccfg delete chunter
svccfg delete zlogin
svccfg delete epmd
