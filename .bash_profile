# Use this .bash_profile for customizations.
# This file is loaded from ~/.bash_profile,
# which is owned by the daptiv dotfiles repository

export USER_PROFILE_LOADED="1"
export PATH=$PATH:~/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export DB_SERVER_NAME=WIN-2012R2

alias yarnl="yarn install --pure-lockfile"

# Load all autocompletions if any are installed
if [ -d /usr/local/etc/bash_completion.d ]; then
    for F in "/usr/local/etc/bash_completion.d/"*; do
        if [ -f "${F}" ]; then
            source "${F}";
        fi
    done
fi

__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
if [ -f "$__GIT_PROMPT_DIR/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Custom
  GIT_PROMPT_THEME_FILE=~/.dotfiles/files/git-prompt-theme.sh
  source "$__GIT_PROMPT_DIR/gitprompt.sh"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
