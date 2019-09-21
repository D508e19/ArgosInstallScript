#!/bin/bash

mkdir SimulatorFiles
cd SimulatorFiles


#----------------- ARGOS Requirements -------------------------------#
sudo apt update -y
sudo apt install -y qtbase5-dev
sudo apt install -y lua5.2
sudo apt install -y freeglut3-dev
sudo apt install -y cmake
sudo apt install -y libfreeimage-dev
sudo apt install -y libfreeimageplus-dev
sudo apt install -y libxi-dev
sudo apt install -y libxmu-dev
sudo apt install -y liblua5.2-dev
sudo apt install -y doxygen
sudo apt install -y graphviz
sudo apt install -y graphviz-dev
sudo apt install -y asciidoc


#----------------- ARGOS -------------------------------#
# Download argos3 https://drive.google.com/uc?export=download&confirm=7Srv&id=1CwcgcxHMfJaGGiJisFQlNAY1IMoPWz1Y
echo "Downloading Argos3"
fileid="1CwcgcxHMfJaGGiJisFQlNAY1IMoPWz1Y"
filename="argos3.deb"
curl -c ./cookie -s -L "https://drive.google.com/uc?id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

echo "Installing Argos3"
sudo dpkg -i argos3.deb

sudo apt install -f
echo "Verify Installation of Argos3"
argos3 -q all

#----------------- ARGoS EXAMPLES -------------------------------#
echo "Downloading Argos3-examples"

git clone https://github.com/ilpincy/argos3-examples.git argos3-examples
cd argos3-examples

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
#----------------- ARGoS test -------------------------------#
echo "Argos3-example diffusion_10 experiment"
cd ..
argos3 -c experiments/diffusion_10.argos

