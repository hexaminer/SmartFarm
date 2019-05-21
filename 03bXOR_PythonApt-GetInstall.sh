ls#! /bin/bash

###################################################################################################
# Install opencv https://docs.opencv.org/4.1.0/d2/de6/tutorial_py_setup_in_ubuntu.html
# https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh
# https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
###################################################################################################

 sudo apt-get install python-opencv

###################################################################################################
# Install django
###################################################################################################
# This is a multi-line comment in batch... it starts with ": '" and ends with "'"
sudo pip install django
sudo pip install psycopg2


: '
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