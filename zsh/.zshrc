# OSX includes /etc/zshrc which unconditionally overwrites HISTFILE so we set
# it back here
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# Stash work aliases in ~/.localrc.  This means they'll stay out of your
# main dotfiles repository, but you'll have access to them.
if [ -f "${HOME}/.config/.localrc" ]; then
    source "${HOME}/.config/.localrc" 
fi

# all my zsh files
typeset -U config_files
config_files=($HOME/.dotfiles/**/*.zsh)

# load everything but path and completion files
# :# means "remove the whole string to the right"
# Here we're first removing any path.zsh file then removing andy completion.zsh
# file
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
    source "${file}"
done

# Initialize the autocomplete
autoload -Uz compinit
compinit

# load every completion after autocomplete loads
# (M) means "show the MATCHED portion of the array", so we're keeping and
# completion.zsh file
for file in ${(M)config_files:#*/completion.zsh}; do
    source "${file}"
done

unset config_files


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add my custom commands
export PATH="$PATH:$HOME/.dotfiles/bin"
