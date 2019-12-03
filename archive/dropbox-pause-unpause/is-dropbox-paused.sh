#!/usr/bin/env zsh -f

DB_STATUS=$(ps cx | awk -F' ' '/ Dropbox$/{print $3}')

case "$DB_STATUS" in
	T)
				# Dropbox is paused
				:
	;;

	*)
				exit 0
	;;
esac


# Check if command exists
# if (( $+commands[dropbox-pause-unpause.sh] ))
NAME="$0:t:r"  # 'is-dropbox-paused'
PID=$(ps cx | awk -F' ' '/ Dropbox$/{print $1}')
osascript -e "display notification \"Dropbox is paused.\" with title \"Reminder\""
