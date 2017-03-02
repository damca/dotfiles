#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

brew update

# cli tools
brew install ack
# brew install tree  # find seems to work fine
# brew install wget  # not doing web developement

# development server setup
# brew install nginx
# brew install dnsmasq

# development tools
brew install git
brew install hub  # wraps git to make certain commands shorter
brew install zsh
brew install z  # tracks most used directories to make cd smarter
brew install diff-so-fancy  # git diff tool
# brew install macvim --override-system-vim
# brew install reattach-to-user-namespace  # intended to fix pbcopy/paste in tmux: unsupported on new sierra OS
# brew install tmux  # iterm2 seems to do fine with split windows
# brew install highlight  # source code formatter to make pretty html (or other "display"coded text: TeX, LaTex, RTF, etc.) snippets for blogs, etc.
# brew install nvm  # node virtual machine:  using node.js currently
brew install markdown  # text to HTML conversion tool

# install neovim
brew install neovim/neovim/neovim

# other tools
brew install cask
brew cask install fiji  # FIJI is just ImageJ


# Blogging
brew cask install marked  # markdown writing app
brew install ruby
gem install jekyll bundler
brew install wget

exit 0
