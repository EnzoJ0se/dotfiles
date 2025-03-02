#!/usr/bin/env bash

# Based on the tmux-windownizer script by ThePrimeagen

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~ ~/Work/Development/dev ~/Work/Development ~/Development \
        -mindepth 1 -maxdepth 2 -type d \
        -path "$HOME/.Trash" -prune -o -print | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

branch_name=$(basename "$selected" | tr . _)
clean_name=$(echo $branch_name | tr "./" "__")

if ! tmux list-sessions 2>/dev/null | grep -q .; then
    tmux new-session -n $clean_name -c $selected -d
fi

session_name=$(tmux display-message -p "#S")
target="$session_name:$clean_name"

if ! tmux has-session -t $target 2> /dev/null; then
    tmux neww -dn $clean_name -c $selected
fi

if [ -n "$TMUX" ]; then
    tmux select-window -t $target
else
    tmux attach -t $session_name
fi
