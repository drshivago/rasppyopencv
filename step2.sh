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
#install virtal environment
pip install virtualenv virtualenvwrapper

echo "#virtualenv and virtualenvwrapper" >> /home/pi/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> /home/pi/.profile
echo "rce /usr/local/bin/virtualenvwrapper.sh" >> /home/pi/.profile

source /home/pi/.profile

mkvirtualenv cv -p python3

pip install numpy

cd opencv-3.0.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=opencv_contrib-3.0.0/modules \
    -d BUILD_EXAMPLES=ON ..

make
make install ldconfig

cd /usr/local/lib/python3.4/site-packages/
mv cv2.cpython-34m.so cv2.so

cd /home/pi/.virtualenvs/cv/lib/python3.4/site-packages/
ln -s /usr/local/lib/python3.4/site-packages/cv2.so cv2.so

echo “THAT IS AS FAR AS IM GOOING NOW CHANGE THE PROFILE FILE AROUND STEP 3 on website.”
