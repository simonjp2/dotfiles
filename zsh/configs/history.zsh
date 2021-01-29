# Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE="${XDG_CACHE_HOME}"/zsh_history
fi

# see https://www.soberkoder.com/better-zsh-history/
HISTSIZE=10000 # the number of commands loaded into memory
SAVEHIST=10000 # the number commands stored in zsh history file

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS # don't record dups in history
setopt HIST_VERIFY # don't execute the selected line directly
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
