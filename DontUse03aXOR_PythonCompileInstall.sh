#! /bin/bash

###################################################################################################
# Install opencv https://docs.opencv.org/4.1.0/d2/de6/tutorial_py_setup_in_ubuntu.html
# https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh
# https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
###################################################################################################

sudo apt-get install build-essential -y
sudo apt-get install cmake libgtk2.0-dev libgtk-3-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install qt5-default -y
sudo apt-get install libavcodec-dev libgstreamer-plugins-base1.0-dev -y7
sudo apt-get install python-dev python3-dev python-numpy python3-numpy libtbb2 libjpeg-dev libpng-dev libtiff5-dev libjpeg62-turbo-dev libjasper-dev libopenexr-dev libwebp-dev libdc1394-22-dev -y
sudo apt-get install zlib -y
sudo apt-get install libatlas-base-dev libvtk6-dev libgdal-dev -y
sudo apt-get install libtheora-dev libvorbis-dev libxvidcore-dev libx26q4-dev libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev -y
sudo apt-get install libeigen3-dev -y # deverá estar a ser instalado pelo pacote libatlas-base-dev
sudo apt-get install ant default-jdk -y

sudo apt-get install libgtkglext1-dev libavresample-dev  liblapack-dev libclapack-dev liblapacke-dev libatlas-dev libmlpack-dev libgtk2.0-dev libgtk-3-dev libopenblas-dev -y

# para ficar com o opencv js https://books.google.pt/books?id=FtCBDwAAQBAJ&pg=PA167&lpg=PA167&dq=%22build_js.py%22&source=bl&ots=PxQk2RZoHz&sig=ACfU3U2gckyr9t8kBDWY0n0ahd5f0m3thg&hl=pt-PT&sa=X&ved=2ahUKEwiGooXu_aniAhUMnhQKHcsYC1EQ6AEwA3oECAkQAQ#v=onepage&q=%22build_js.py%22&f=false
# https://docs.opencv.org/master/d4/da1/tutorial_js_setup.html
# git clone https://github.com/emscripten-core/emsdk.git ~/git/emsdk
# cd ~/git/emsdk
# ./emsdk install latest
# ./emsdk activate latest
# source ./emsdk_env.sh
# echo ${EMSCRIPTEN}

#sudo apt-get install libopen-cv-dev python-opencv -y

# sudo apt-get install git
 git clone https://github.com/opencv/opencv.git ~/git/opencv

cd ~/git/opencv
mkdir build && cd build
# As variáveis do cmake são utilizazas por exemplo nos ficheiros "OpenCVFindLibsGUI.cmake" e "OpenCVFindOpenBLAS.cmake"
#cmake -DWITH_QT=ON -DWITH_GTK=ON -DWITH_LAPACK=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF PYTHON3_EXECUTABLE = /usr/bin/python3  ..
cmake -DWITH_QT=ON -DWITH_GTK=OFF  -DWITH_LAPACK=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install

# git clone https://github.com/opencv/opencv_contrib.git ~/git/opencv_contrib 

# Installation is over. All files are installed in "/usr/local/" folder. Open a terminal and try import "cv2".

## import cv2 as cv
## print(cv.__version__)

###################################################################################################
# Install django
###################################################################################################

: ' This is a multi-line comment in batch... it starts with ": '" and ends with "'"
pip3 install django --user

/home/pi/.local/bin
'
# cp ~/.profile ~/.profile.old
# printf "\n# After pip3 install django --user, set PATH so it includes user's private bin if it exists
: ' This is a multi-line comment in batch... it starts with ": '" and ends with "'"
if [ -d \"\$HOME/.local/bin\" ] ; then
    PATH=\"\$HOME/.local/bin:\$PATH\"
fi\n" >> ~/.profile

# GeoDjango setup
# sudo apt-get update -y && sudo apt-get upgrade -y
#sudo apt-get install binutils libproj-dev gdal-bin libgdal-grass python3-gdal -y
'