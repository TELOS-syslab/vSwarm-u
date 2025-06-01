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

apt-get install -y make gcc

make dep_install

cd ~

if command -v go >/dev/null 2>&1; then
  echo "$(go version) has already Installed!"
else
  GO_VERSION=1.21.6
  GO_BUILD="go${GO_VERSION}.linux-${ARCH}"

  wget --continue https://go.dev/dl/go1.21.6.linux-amd64.tar.gz

  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf ${GO_BUILD}.tar.gz
  rm ${GO_BUILD}.tar.gz

  export PATH=$PATH:/usr/local/go/bin
  sudo sh -c  "echo 'export PATH=\$PATH:/usr/local/go/bin' >> /etc/profile"
  sudo sh -c  "echo 'export PATH=\$PATH:/usr/local/go/bin' >> ${HOME}/.bashrc"

  source ${HOME}/.bashrc
  echo "Installed: $(go version)"
fi

cd /root/tools/client

make all

cp client ~/test-client

#Nedd to run emulator to build test-client

#cat /etc/profile

#make all

#cp client /root/test-client

shutdown -h now
