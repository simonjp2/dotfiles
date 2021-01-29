# use menu style select tabbing allows using arrow keys
zstyle ':completion:*' menu select

# Matches case insensitive then partial word completion
# http://zsh.sourceforge.net/Doc/Release/Completion-Widgets.html#Completion-Matching-Control
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*'
