# myTmuxConfig

https://github.com/gpakosz/.tmux

# Adjustments
```
# -- user customizations -------------------------------------------------------
# this is the place to override or undo settings

# increase history size
set -g history-limit 10000

# start with mouse mode enabled
#set -g mouse on

# force Vi mode
#   really you should export VISUAL or EDITOR environment variable, see manual
#set -g status-keys vi
#set -g mode-keys vi

# replace C-b by C-a instead of using both prefixes
# set -gu prefix2
# unbind C-a
# unbind C-b
# set -g prefix C-a
# bind C-a send-prefix

# move status line to top
#set -g status-position top

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# remap prefix from 'C-b' to 'C-Space'
unbind C-b
set-option -g prefix C-Space
bind-key C-Space send-prefix

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window
```
