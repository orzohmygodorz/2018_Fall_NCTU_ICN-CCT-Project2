#!/bin/bash

apt-get install ssh

cd ../
git clone https://github.com/dlinknctu/OpenNet.git
cd OpenNet
./configure.sh
./install.sh master

