### For Ubuntu14.04
### Initial Setting: install vim, tmux and make colorful

#!/bin/bash

### About vim and vimColor setting ###

# update pkgs
sudo apt-get update

#  install "vim" for editting & "ruby" for coloring
sudo apt-get install vim ruby

# set env variables for color
export TERM=xterm-256color

# download the source & use it
wget https://raw.githubusercontent.com/gawin/bash-colors-256/master/256-xterm-colors
ruby 256-xterm-colors

# configuration
echo "hi comment ctermfg=033" | sudo tee --append /etc/vim/vimrc
echo "set nu" | sudo tee --append /etc/vim/vimrc
echo "set cursorline" | sudo tee --append /etc/vim/vimrc

### About making Terminal colorful in Ubuntu14.04 ###
sed -i "s/\#force_color_prompt=yes/force_color_prompt=yes/g" ~/.bashrc

### About tmux and tmuxColor setting ###

# install tmux
sudo apt-get install tmux

# configuration
echo "set -g default-terminal \"screen-256color\"" | sudo tee --append /etc/tmux.conf

### Reboot ###
sudo reboot
