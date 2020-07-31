#!/bin/sh

echo -e "\n\nInstalling apt packages..."
echo "=============================="

sudo apt update
sudo apt upgrade

# cli tools
sudo apt install ack tree curl man-db manpages fzf

# development server setup
sudo apt install nginx dnsmasq dnsutils ftp vsftpd nmap

# development tools
sudo apt install git zsh python python3 python3-venv
mkdir ~/venvs
python3 -m venv ~/venvs/web
source ~/venvs/web/bin/activate
pip install wheel pandas plotly dash

# install neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz
sudo cp -rf nvim-linux64/* /usr/local
rm -rf nvim-linux64
rm -rf nvim-linux64.tar.gz

# base16-shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

exit 0
