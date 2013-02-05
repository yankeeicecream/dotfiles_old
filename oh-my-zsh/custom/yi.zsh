#bindkey "^b" backward-word           # commented out so it doesn't override tmux designated key - use ctrl right arrow instead
bindkey "^[b" backward-kill-word
bindkey "^f" forward-word
bindkey "^[f" kill-word
bindkey "^[^[[C" kill-word
bindkey "^[^[[D" backward-kill-word
