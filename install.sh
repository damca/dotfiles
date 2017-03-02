#!/usr/bin/env bash

echo "Installing dotfiles"


source install/link.sh


if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"
    source install/brew.sh
    # set up git ssh
    echo "Initializing submodule(s)"
    git submodule update --init --recursive
    # see 'set backupdir' and 'set directory' in .vimrc
    echo "creating vim directories"
    mkdir -p ~/.vim-tmp
    echo "Configuring zsh as default shell"
    echo $(which zsh) >> /etc/shells
    chsh -s $(which zsh)
    # Make italic terminfo available
    tic $DOTFILES/resources/xterm-256color-italic
    # Need to restart
fi

echo "Done."
