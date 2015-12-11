#! /bin/bash
printf "Updating your package repositories (Will take a few minutes....)\n"
sudo apt-get -y update >/dev/null </dev/null

printf "Installing Serial communication library\n"
sudo apt-get -y install libserial-dev >/dev/null </dev/null

printf "Installing AVR tools\n"
sudo apt-get -y install avr-libc avrdude gcc-avr >/dev/null </dev/null

printf "Installing coriander\n"
sudo apt-get -y install coriander >/dev/null </dev/null

printf "Installing necessary ROS packages\n"
sudo apt-get -y install ros-indigo-desktop-full ros-indigo-uvc-camera ros-indigo-camera1394 ros-indigo-camera-umd </dev/null
#long install time

printf "Installing necessary Gazebo related packages\n"
if [ -f ./install_gazebo.sh ]; then
    bash ./install_gazebo.sh
else
    curl --silent https://raw.githubusercontent.com/auv-iitb/misc/master/install_gazebo.sh | bash
fi

printf "Installing flex and bison for parser\n"
sudo apt-get -y install flex bison >/dev/null </dev/null

printf "Installing google testing environment\n"
sudo apt-get install libgtest-dev google-mock ros-indigo-rostest </dev/null

printf "Installing additional usefull programs\n"
sudo apt-get -y install cutecom tree cloc vim git guake terminator tilda python-pip openssh-server >/dev/null </dev/null

printf "Installing usefull python packages\n"
sudo pip install -U numpy scipy matplotlib pyqtgraph autocomplete </dev/null
