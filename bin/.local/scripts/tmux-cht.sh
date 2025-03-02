#!/usr/bin/env bash

selected=`cat ~/.local/scripts/tmux-cht-languages ~/.local/scripts/tmux-cht-command | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query (or blank for all results): " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl -s cht.sh/$selected/$query | less"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi

