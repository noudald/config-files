#!/bin/bash

echo "Switch to oh-my-zsh"
sudo apt-get install zsh git
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
