#!/usr/bin/env bash

set -e

# add apt source
apt-get install -y lsb-release
sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
apt-get -y update

# install full version
apt-get install -y ros-melodic-desktop-full
apt-get install -y python-rosdep
apt-get install -y python-rosinstall \
    python-rosinstall-generator python-wstool build-essential
