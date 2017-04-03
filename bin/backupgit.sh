#!/usr/local/bin/zsh

python has_been_week.py
if [ $? -eq 0 ]; then
    osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/git\""
    dropbox-pause-unpause.sh --pause
    cp -rf ~/git ~/Dropbox 2> ~/git/backuperr.log
    echo "Backed up git $(date +%d.%m.%y-%H:%M:%S)" >> ~/git/backup.log
    dropbox-pause-unpause.sh --unpause
    osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/git\""
else;
    msg="Attempted backup $(date +%d.%m.%y-%H:%M:%S), hasn't been week since last backup in log" 
    echo $msg >> ~/git/backuperr.log
    echo $msg
fi
