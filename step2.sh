#!/bin/bash

apt-get install build-essential git cmake pkg-config -y
#load image I/O
apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y
#load video I/O
apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
apt-get install libxvidcore-dev libx264-dev -y
#install gtk
apt-get install libgtk2.0-dev -y
apt-get install libatlas-base-dev gfortran -y

apt-get install python2.7-dev python3-dev -y

wget -O opencv.zip https://codeload.github.com/opencv/opencv/zip/3.0.0
unzip opencv.zip

wget -O opencv_contrib.zip https://codeload.github.com/opencv/opencv_contrib/zip/3.0.0
unzip opencv_contrib.zip

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install virtualenv virtualenvwrapper
echo “THAT IS AS FAR AS IM GOOING NOW CHANGE THE PROFILE FILE AROUND STEP 3 on website.”
