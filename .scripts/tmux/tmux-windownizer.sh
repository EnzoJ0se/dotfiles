#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~ ~/Work/Development/dev ~/Work/Development ~/Development  -mindepth 1 -maxdepth 2 -type d | fzf)
fi

session_name=$(tmux display-message -p "#S")
branch_name=$(basename "$selected" | tr . _)
clean_name=$(echo $branch_name | tr "./" "__")
target="$session_name:$clean_name"

if ! tmux has-session -t $target 2> /dev/null; then
    tmux neww -dn $clean_name -c $selected
fi

tmux select-window -t $target
