#!/bin/bash

sudo apt install cmake gcc -y || error "Could not install packages"
cd /tmp || error "Could not move to /tmp folder"
rm -rf ./Vulkan-Headers
git clone https://github.com/KhronosGroup/Vulkan-Headers.git
cd Vulkan-Headers
mkdir build 
cd build
cmake ..
make -j$(nproc)
sudo make install || error "Make install failed"
rm -rf /tmp/Vulkan-Headers
