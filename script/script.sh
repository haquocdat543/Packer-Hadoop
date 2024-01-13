#!/bin/bash

export HADOOP_VER="3.3.6"
sudo su -
sudo apt update 
sudo apt upgrade -y
sudo apt-get install openjdk-8-jdk -y
su - ec2-user
wget http://apache.cs.utah.edu/hadoop/common/current/hadoop-${HADOOP_VER}.tar.gz
tar -xvzf hadoop-${HADOOP_VER}.tar.gz
mv -f hadoop-${HADOOP_VER} hadoop
rm -f hadoop-${HADOOP_VER}.tar.gz
