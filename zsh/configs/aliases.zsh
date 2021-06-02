alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

alias l='ls -lahFG'
alias ll='ls -lhFG'
alias rm='rm -iv'
alias cp='cp -iv'
alias grep='grep --color=auto -E'

alias brewup='brew update && brew bundle'

# Get me a random joke, just for fun
# https://icanhazdadjoke.com/api#fetch-a-random-dad-joke
alias joke='http --json --print b https://icanhazdadjoke.com/'

# use custom python
function python {
    local install_dir="/usr/local/opt/python@3.9/libexec/bin" 
    local me="${0}"
    if [[ ! -d "${install_dir}" ]]; then
        printf "Unable to find %s. Check python alias: %s" "${install_dir}" "${me}"
    fi
    
    "${install_dir}"/python "${@}"
}
