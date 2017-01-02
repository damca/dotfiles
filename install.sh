#!/usr/bin/env bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"
    source install/brew.sh
    source install/osx.sh
    # source install/nvm.sh  # Not using node virtual machine
    # create a backup of the original nginx.conf
    # mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
    # ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
    # symlink the code.dev from dotfiles
    # ln -s ~/.dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
elif [ "$(uname)" == "Linux"]; then
    # Typically echo will literally output the string. -e lets it interpret
    # backslash escapes
    echo -e "\n\nRunning on Linux"
    source install/apt.sh
fi

# see 'set backupdir' and 'set directory' in .vimrc
echo "creating vim directories"
mkdir -p ~/.vim-tmp
echo "Configuring zsh as default shell"
echo $(which zsh) >> /etc/shells
chsh -s $(which zsh)
echo "Done."
