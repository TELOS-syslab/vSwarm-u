#!/bin/bash

#Authored by Liren Zhu 

set -x

curl  "http://10.0.2.2:3003/client.tar.gz" -f -o /root/client.tar.gz

tar -C /root -xvzf /root/client.tar.gz

#sudo sh -c  "echo 'export PATH=\$PATH:/usr/local/go/bin' >> /etc/profile"
#sh -c  "echo 'export PATH=\$PATH:/usr/local/go/bin' >> ~/.bashrc"
#source /etc/profile
#echo $PATH

#rm -rf /root/client.tar.gz

cd /root/tools/client

#Nedd to run emulator to build test-client

#cat /etc/profile

#make all

#cp client /root/test-client

shutdown -h now
