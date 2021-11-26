#!/bin/bash

echo ""
echo "          ROM ROBOTICS LTD     "
echo ""

# UPDATE, UPGRADE
echo " ROM ROBOTICS LTD:: updating ....."
source ~/.bashrc
sudo apt update && sudo apt upgrade

# INSTALL ROS PACKAGES
echo " ROM ROBOTICS LTD:: installing required ros packages ............"
sudo apt install ros-noetic-robot ros-noetic-navigation ros-noetic-depthimage-to-laserscan



# CONFIGURE NETWORK
echo " ROM ROBOTICS LTD:: writing Network Setting to ~/.bashrc ........"
echo "export ROS_IP=192.169.100.158" >> ~/.bashrc
echo "export ROS_HOSTNAME=192.168.100.158" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://192.168.100.57:11311" >> ~/.bashrc

# SOURCE BASHRC
echo " ROM ROBOTICS LTD:: sourcing .bashrc to ~/.profile .............."
echo "if [ -f ~/.bashrc ]; then " >> ~/.profile
echo "  . ~/.bashrc " >> ~/.profile
echo "fi " >> ~/.profile

# INSTALL UDEV RULES
echo " ROM ROBOTICS LTD:: install udev rules .........................."
sudo cp `rospack find rom2109_controller`/udev/rplidar.rules /etc/udev/rules.d
sudo ln -s /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0 ~/robotController

# COMPILE ROBOT DRIVER
cd ~/ROM/catkin_ws/
catkin_make

