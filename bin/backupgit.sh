#!/bin/zsh

osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/git\""
dropbox-pause-unpause.sh --pause
cp -rf ~/git ~/Dropbox >~/git/backup.log 2>~/git/backuperr.log
echo "Backed up dotfiles $(date +%d.%m.%y-%H:%M:%S)" >> ~/.dotfiles/backup.log
dropbox-pause-unpause.sh --unpause
osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/git\""
