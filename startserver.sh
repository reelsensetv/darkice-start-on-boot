#!/bin/bash

#source params.sh
while true; do
echo $PPID > pid
darkice -c /usr/local/etc/darkice/darkice.cfg
sleep 1
done
