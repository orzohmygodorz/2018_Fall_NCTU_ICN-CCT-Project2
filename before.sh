#!/bin/bash

# install "vim" for editting & configuration
apt-get update
apt-get install vim
echo "set nu" | sudo tee --append /etc/vim/vimrc
echo "set cursorline" | sudo tee --append /etc/vim/vimrc
echo "set ts=4" | sudo tee --append /etc/vim/vimrc

# make terminal colorful in Ubuntu14.04
sed -i "s/\#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc

