#!/bin/sh

if test ! $(which apt-get); then
    echo "apt-get detected... "
fi

echo -e "\n\nInstalling packages..."
echo "=============================="

# cli tools
apt-get install ack
apt-get install tree  # find seems to work fine
# apt-get install wget  # not doing web developement

# development server setup
# apt-get install nginx
# apt-get install dnsmasq

# development tools
apt-get install git
apt-get install hub  # wraps git to make certain commands shorter
apt-get install zsh
apt-get install z  # tracks most used directories to make cd smarter
apt-get install diff-so-fancy  # git diff tool
# apt-get install macvim --override-system-vim
# apt-get install reattach-to-user-namespace  # intended to fix pbcopy/paste in tmux: unsupported on new sierra OS
# apt-get install tmux  # iterm2 seems to do fine with split windows
# apt-get install highlight  # source code formatter to make pretty html (or other "display"coded text: TeX, LaTex, RTF, etc.) snippets for blogs, etc.
# apt-get install nvm  # node virtual machine:  using node.js currently
apt-get install markdown  # text to HTML conversion tool

# install neovim
apt-get install neovim/neovim/neovim

# other tools
apt-get install cask
apt-get cask install fiji  # FIJI is just ImageJ

# Blogging
apt-get cask install marked  # markdown writing app
apt-get install ruby
gem install jekyll bundler
apt-get install wget

exit 0
