#!/bin/zsh

osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/git\""
dropbox-pause-unpause.sh --pause
cp -rf ~/git ~/Dropbox >~/git/backup.log 2>~/git/backuperr.log
dropbox-pause-unpause.sh --unpause
osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/git\""
