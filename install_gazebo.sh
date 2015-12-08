#! /bin/bash
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update -y </dev/null
sudo apt-get -y remove ros-indigo-gazebo* </dev/null
sudo apt-get -y remove gazebo* </dev/null
sudo apt-get -y install gazebo5 </dev/null
sudo apt-get -y install ros-indigo-gazebo5-* </dev/null
