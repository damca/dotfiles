#!/usr/local/bin/zsh

osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/git\""
dropbox-pause-unpause.sh --pause
cp -rf ~/git ~/Dropbox 2>~/git/backuperr.log
echo "Backed up git $(date +%d.%m.%y-%H:%M:%S)" >> ~/git/backup.log
dropbox-pause-unpause.sh --unpause
osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/git\""
