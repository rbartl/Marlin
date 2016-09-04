#!/bin/bash

if [ -f Marlin/Configuration.h ] ; then
  echo Please create a Configuration.h in the Marlin subdirectory
  exit 1
fi
if ! command -v git > /dev/null ; then 
  echo Please install git
  exit 1
fi
if ! command -v cmake > /dev/null ; then 
  echo Please install cmake
  exit 1
fi


if [ ! -d marlin-cmake ] ; then 
  git clone https://github.com/tohara/marlin-cmake.git  
fi

mkdir build
cd build
cmake .. -Bbuild -DUPLOAD_PORT=/dev/ttyUSB0  -DARDUINO_SDK_PATH=/root/arduino/
echo 'Execute "make" to build Marlin or "make upload"'
make

