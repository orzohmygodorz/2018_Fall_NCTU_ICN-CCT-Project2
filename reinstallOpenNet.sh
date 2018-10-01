#!/bin/bash

rm -rf ~/ansible
rm -rf ~/OpenNet

cd ~
git clone https://github.com/dlinknctu/OpenNet.git
cd ~/OpenNet
./configure.sh
./install.sh master

