#!/usr/bin/env bash

echo "Installing dotfiles"


if [ "$(uname)" == "Linux" ]; then
    source install/link.sh
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
    nvim +PlugInstall +CheckHealth
fi

echo "Done."
