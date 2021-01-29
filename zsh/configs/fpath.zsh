# Add each topic folder to fpath so they can add functions and completions scripts
for topic_folder ($HOME/.dotfiles/*)
do
    if [ -d "${topic_folder}" ]; then
        fpath=("${topic_folder}" ${fpath})
    fi
done

# Add functions to the fpath and autoload them
# (:t) strips off the directory part of each name
fpath=("$HOME/.dotfiles/functions" ${fpath})
autoload -U $HOME/.dotfiles/functions/*(:t)

