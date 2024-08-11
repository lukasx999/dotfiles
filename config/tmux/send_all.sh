#!/usr/bin/env bash

# TODO: menu select for if it should be sent to current window, pane, session

tmux command-prompt -T command -p "Send-all:" \
"run-shell \"tmux list-panes -a -F '##{session_name}:##{window_index}.##{pane_index}' | xargs -I PANE tmux send-keys -t PANE '%1' Enter\""


