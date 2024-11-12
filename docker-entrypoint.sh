#!/bin/bash
touch /home/ubuntu/.Xauthority
echo "hahaha" | /usr/bin/vncpasswd -f > /home/ubuntu/.vncpasswd
chown ubuntu:ubuntu /home/ubuntu/.vncpasswd
chmod 600 /home/ubuntu/.vncpasswd
/usr/bin/supervisord
