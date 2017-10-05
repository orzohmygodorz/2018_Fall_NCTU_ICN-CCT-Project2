#!/bin/bash

# Download source code from github
sudo apt-get install git
git clone https://github.com/opennetworkinglab/onos.git
cd onos && git checkout onos-1.11

# Install tools
# Install Karaf, Maven
cd; mkdir Downloads Applications
cd Downloads
wget http://archive.apache.org/dist/karaf/3.0.5/apache-karaf-3.0.5.tar.gz
wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -zxvf apache-karaf-3.0.5.tar.gz -C ../Applications/
tar -zxvf apache-maven-3.3.9-bin.tar.gz -C ../Applications/

# Install and setup compiler
# Install Oracle Java8, yes to all license questions
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer oracle-java8-set-default -y
# Setup JAVA_HOME
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
. ~/.bashrc

# Setup and test the environment
# Setup ONOS env
echo "export ONOS_ROOT=~/onos" >> ~/.bashrc
echo 'source $ONOS_ROOT/tools/dev/bash_profile' >> ~/.bashrc
. ~/.bashrc
# Test ONOS env
cd ~/onos
mvn clean install

# Change cell settings
# Find cells in ONOS_ROOT/tools/test/cells
cd ~/onos/tools/test/cells
# Change cell to demo cell
. ~/.bashrc
cell demo

# install zip and unzip
sudo apt-get update
sudo apt-get install zip unzip

# Build and run ONOS with buck
# Build ONOS
. ~/.bashrc
ONOS_ROOT=~/onos
. $ONOS_ROOT/tools/dev/bash_profile
cd ~/onos
onos-buck build onos
onos-buck run onos-local

