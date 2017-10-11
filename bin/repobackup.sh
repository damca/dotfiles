#!/usr/local/bin/zsh

if [ $EUID != 0 ]; then
    osascript -e "display notification \"Requesting administrator priveledges for $0\" with title \"Backing up ~/repos\""
    osascript -e "do shell script \"$0 $@\" with administrator privileges"
    exit $?
fi

# python has_been_week.py /Users/damca/repos/backup.log
if [ $? -eq 0 ]; then
    # osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/repos\""
    # dropbox-pause-unpause.sh --pause
    echo "Backing up on: $(date +%d.%m.%y-%H:%M:%S)" >> ~/repos/backuprsync.log
    if [ -d /Volumes/dbmRED ]; then
        back="/Volumes/dbmRED"
    fi
    if [ -d /Users/Dropbox ]; then
        back="/Users/Dropbox"
    fi
    echo "Found $back backing up to it..."
    sudo rsync -ah --delete --stats --compress-level=0 --inplace /Users/repos $back | sed '0,/^$/d' | tee ~/repos/backuprsync.log 2> ~/repos/backuperr.log
    echo "Backed up repos on: $(date +%d.%m.%y-%H:%M:%S)"
    echo "Backed up repos on: $(date +%d.%m.%y-%H:%M:%S)" >> ~/repos/backup.log
    # dropbox-pause-unpause.sh --unpause
    # osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/repos\""
else;
    msg="Attempted backup $(date +%d.%m.%y-%H:%M:%S), hasn't been week since last backup in log" 
    echo $msg
fi
