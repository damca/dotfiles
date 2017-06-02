#!/usr/local/bin/zsh

if [ $EUID != 0 ]; then
    osascript -e "display notification \"Requesting administrator priveledges for $0\" with title \"Backing up ~/git\""
    osascript -e "do shell script \"$0 $@\" with administrator privileges"
    exit $?
fi

# python has_been_week.py /Users/damca/.dotfiles/backup.log
if [ $? -eq 0 ]; then
    echo "Backing up on: $(date +%d.%m.%y-%H:%M:%S)" >> ~/.dotfiles/rsync.log
    if [ -d /Volumes/dbmRED ]; then
        back="/Volumes/dbmRED"
    fi
    if [ -d /Volumes/e500/Dropbox ]; then
        back="/Volumes/e500/Dropbox"
    fi
    echo "Found $back backing up to it..."
    sudo rsync -ah --delete --stats --compress-level=0 --inplace ~/.dotfiles $back | sed '0,/^$/d' | tee ~/.dotfiles/backuprsync.log 2> ~/.dotfiles/backuperr.log
    echo "Backed up .dotfiles on: $(date +%d.%m.%y-%H:%M:%S)"
    echo "Backed up .dotfiles on: $(date +%d.%m.%y-%H:%M:%S)" >> ~/.dotfiles/backup.log
else;
    msg="Attempted backup $(date +%d.%m.%y-%H:%M:%S), hasn't been week since last backup in log" 
    echo $msg
fi
