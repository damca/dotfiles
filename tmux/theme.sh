# access character pallette with CTL + CMD + SPACE
tm_icon="🍎"
tm_color_active=#aef28b
tm_color_inactive=#aaec33
tm_color_feature=#6ac943
tm_color_music=#d04ef2
tm_active_border_color=#29874c

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-style color0
set-option -g status-style $tm_color_active
set-option -g status-style default
set-option -g status-style default

# default window title colors
set-window-option -g window-status-style $tm_color_inactive
set-window-option -g window-status-style default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-style $tm_color_active
set-window-option -g window-status-current-style default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-style $tm_color_inactive
set-option -g pane-active-border-style $tm_active_border_color

# message text
set-option -g message-style default
set-option -g message-style $tm_color_active

# pane number display
# set-option -g display-panes-active-color $tm_color_active
# set-option -g display-panes-color $tm_color_inactive

# clock
# set-window-option -g clock-mode-color $tm_color_active

tm_tunes="#[style=$tm_color_music]#(osascript ~/.dotfiles/applescripts/tunes.scpt | cut -c 1-50)"
tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[style=$tm_color_inactive] %R %d %b"
tm_host="#[style=$tm_color_feature,bold]#h"
tm_session_name="#[style=$tm_color_feature,bold]$tm_icon #S"

set -g status-left $tm_session_name' '
set -g status-right $tm_tunes' '$tm_date' '$tm_host
