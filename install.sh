#!/usr/bin/env bash

echo "Installing dotfiles"


source install/link.sh


if [ "$(uname)" == "Linux" ]; then
    echo -e "\n\nRunning on Linux"
    source install/apt.sh
    # set up git ssh
    echo "Initializing submodule(s)"
    git submodule update --init --recursive
    # see 'set backupdir' and 'set directory' in .vimrc
    echo "creating vim directories"
    mkdir -p ~/.vim-tmp
    echo "Configuring zsh as default shell"
    echo $(which zsh) >> /etc/shells
    chsh -s $(which zsh)
fi

echo "Done."
