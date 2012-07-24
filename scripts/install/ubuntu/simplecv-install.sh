#!/bin/sh
#
# This script is used to install SimpleCV very quickly on
# * Ubuntu 12.04
# *(Other versions may work)
#
# !Warning: Please review this script, you are responsible for anything
# it does to your system. You should be able to run these from the
# command line manually if desired. If you are running into issues
# please visit the mailing list at:
# http://www.simplecv.org
#

simplecv_auto_install() {	
	echo "Installing SimpleCV"
	sleep 1
	install_opencv
	install_numpy_scipy
	install_pygame
	install_setuptools
	install_ipython
	install_simplecv
	echo "For more info go to http://simplecv.org/"
	echo "to run simplecv just type:"
	echo "$ simplecv"
}

install_opencv(){
	echo "Installing OpenCV..."
	sudo apt-get install libopencv-*
	sudo apt-get install python-opencv
	echo "OpenCV installed"
}

install_numpy_scipy() {
	echo "Installing numpy and scipy"
	sudo apt-get install python-numpy python-scipy
	echo "numpy and scipy installed"
}

install_pygame() {
	echo "Installing pygame"
	sudo apt-get install python-pygame
	echo "pygame installed"
}

install_setuptools(){
	echo "Installing python-setuptools"
	sudo apt-get install python-setuptools python-pip
	echo "setuptools installed"
}

install_ipython() {
	echo "Installing ipython and ipython notebook"
	sudo apt-get install ipython ipython-notebook
	echo "ipython installed"
}


install_simplecv(){
	echo "Installing SimpleCV"
	sudo pip install -U https://github.com/ingenuitas/SimpleCV/zipball/master
	echo "SimpleCV Installation finished"
}

simplecv_manual_install () {
  reset
  echo "[Manual-Installing SimpleCV]"
  read -p "Install OpenCV? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_opencv
  fi
  read -p "Install Numpy/Scipy? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_numpy_scipy
  fi
  read -p "Install Pygame? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_pygame
  fi
  read -p "Install Setuptools/PIP? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_setuptools
  fi
  read -p "Install IPython? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_ipython
  fi  
  read -p "Install SimpleCV? (y/N) " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      install_simplecv
  fi
  
	echo "For more info go to http://simplecv.org/"
	echo "to run simplecv just type:"
	echo "$ simplecv"

}

# The main script launch point
reset
while :
do
    case "$1" in
      -i | --install)
        echo "install command line"
        simplecv_auto_install
        return
        ;;
      -m | --manual)
        echo "install simplecv manually"
        simplecv_manual_install
        return
        ;;        
    esac
    break
done

while true; do
    echo "--------------------------------------------------------------------"
    echo "SimpleCV setup tool"
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "[a]uto install"
    echo "[m]anual install"
    echo "e[x]it"
    echo
    read -p "which option:" choice
    case $choice in
        [a]* ) simplecv_auto_install;;
        [m]* ) simplecv_manual_install;;
        [x]* ) echo "exiting...";break;;
        * ) echo "Please choose an option.";;
    esac
done
