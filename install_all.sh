#! /bin/bash
# run this setup with the following command
# curl --silent https://raw.githubusercontent.com/auv-iitb/misc/master/install_all.sh | bash

x=$(pwd)

# Setup sources list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
# Install

if [ -f ./install_deps.sh ]; then
    bash ./install_deps.sh
else
    curl --silent https://raw.githubusercontent.com/auv-iitb/misc/master/install_deps.sh | bash
fi

# Initialize rosdep
sudo rosdep init
rosdep update
sudo apt-get -y install python-rosinstall </dev/null

# Environment setup
source /opt/ros/indigo/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make
source devel/setup.bash

printf "Getting the latest robosub repository"
cd ~/catkin_ws/src
git clone http://github.com/auv-iitb/robosub.git
if [ $? -eq 0 ]; then
    cd ~/catkin_ws/
    catkin_make

    printf "Adding required files to ~/.bashrc\n"
    echo 'source '`rospack find auv_utils`'/src/utility/bash/robosub_aliases' >> ~/.bashrc
    echo 'source '`rospack find auv_utils`'/src/utility/bash/robosub_bash' >> ~/.bashrc
fi

cd $x
