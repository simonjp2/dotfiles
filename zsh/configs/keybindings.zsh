# Handy keybindings
bindkey "^B" backward-word
bindkey "^F" forward-word

# search backward/forward in history for a line beginning with first word
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# search backward/forward in history for a line beginning with the current line 
# up to the cursor
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
