# Prompt expansions - http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Visual-effects
typeset -AHg fg

# Helpful color definitions
fg=(
    green 2
    yellow 3
    blue 4
    magenta 5
    cyan 6
    bright_red 9
)

prompt_color() {
    print "%F{$fg[$2]}$1%f"
}
prompt_bright_red() { prompt_color "$1" "bright_red" }
prompt_green() { prompt_color "$1" "green" }
prompt_yellow() { prompt_color "$1" "yellow" }
prompt_blue() { prompt_color "$1" "blue" }
prompt_magenta() { prompt_color "$1" "magenta" }
prompt_cyan() { prompt_color "$1" "cyan" }
prompt_spaced() { [[ -n "$1" ]] && print " $@" }

# Helper functions
# --------------------------------------------
# %2~ means "show the last two components of the path, and show the
# home directory as ~
prompt_shortened_path() { prompt_green "%2~" }

# %(?.true-text.false-text) "shows true-text if the exit status of the previous
# command was 0"
prompt_error() { prompt_bright_red "%(?..✗ )" }

# %n(j.true-text.false-text) "shows true-text if the number of jobs is greater
# than n"
prompt_jobs() { prompt_yellow "%1(j.!! .)" }

# Git-related prompt stuff
# --------------------------------------------

# vcs_info docs: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats $(prompt_cyan "(%b)")
zstyle ':vcs_info:git*' actionformats $(prompt_bright_red "(%b|%a)")

prompt_git_status_symbol() {
    local symbol dirty
    dirty="∗"

    # if there are any modified files mark the branch as dirty
    # `git status --porcelain` gives the status in an easy to parse format for
    # scripts.  The format for each path is one of the form
    # XY PATH
    # XY ORIG_PATH -> PATH
    # X shows the status of the index, Y shows the status of the work tree.
    # For untracked paths XY are ??. See `git status --help` for other status
    # codes.
    if git status --porcelain | grep -q -E '^[^?]{2} '; then
        symbol=$(prompt_bright_red "[${dirty}]")
    fi

    print "${symbol}"
}

prompt_git_branch() {
    #vcs_info_msg_0_ is set by the `zstyle vcs_info` directives
    # It is the colored branch name
    print "${vcs_info_msg_0_}"
}

prompt_full_git_status() {
    if [[ -n "${vcs_info_msg_0_}" ]]; then
        prompt_spaced "$(prompt_git_branch) $(prompt_git_status_symbol)"
    fi
}

# `precmd` is a magic function that's run right before the prompt is evaluated
# on eachl ine.
# Here, it's useed to capture the git sstatus to show in the prompt.
function precmd {
    vcs_info
}

# PROMPT_SUBST allows `$(function)` inside the PROMPT, which will be re-evaluated
# whenever the prompt is display. Don't put the PROMPT in double quotes, which
# will immediately evalue the "$(code)".
setopt PROMPT_SUBST

PROMPT='$(prompt_jobs)'
PROMPT+='$(prompt_error)'
PROMPT+='$(prompt_shortened_path)'
PROMPT+='$(prompt_full_git_status)'
PROMPT+='$(prompt_bright_red "$ ")'
