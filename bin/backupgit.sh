#!/usr/local/bin/zsh

if [ $EUID != 0 ]; then
    osascript -e "display notification \"Requesting administrator priveledges for $0\" with title \"Backing up ~/git\""
    osascript -e "do shell script \"$0 $@\" with administrator privileges"
    exit $?
fi

python has_been_week.py /Users/damca/git/backup.log
if [ $? -eq 0 ]; then
    osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/git\""
    dropbox-pause-unpause.sh --pause
    sudo rsync -ah --delete --stats --compress-level=0 --inplace /Volumes/e500/git /Volumes/dbmRED | sed '0,/^$/d' | tee ~/git/rsync.log 2> ~/git/backuperr.log
    echo "Backed up git on: $(date +%d.%m.%y-%H:%M:%S)" >> ~/git/backup.log
    dropbox-pause-unpause.sh --unpause
    osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/git\""
else;
    msg="Attempted backup $(date +%d.%m.%y-%H:%M:%S), hasn't been week since last backup in log" 
    echo $msg >> ~/git/backuperr.log
    echo $msg
fi
