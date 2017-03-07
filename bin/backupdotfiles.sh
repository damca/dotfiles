#!/bin/zsh
osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/.dotfiles\""
dropbox-pause-unpause.sh --pause
cp -rf ~/.dotfiles ~/Dropbox/dotfiles > ~/.dotfiles/backup.log 2> ~/.dotfiles/backuperr.log
dropbox-pause-unpause.sh --unpause
osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/.dotfiles\""
