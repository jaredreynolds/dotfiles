# Use this .bash_profile for customizations.
# This file is loaded from ~/.bash_profile,
# which is owned by the daptiv dotfiles repository

export USER_PROFILE_LOADED="1"

__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
if [ -f "$__GIT_PROMPT_DIR/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Custom
  GIT_PROMPT_THEME_FILE=~/.dotfiles/files/git-prompt-theme.sh
  source "$__GIT_PROMPT_DIR/gitprompt.sh"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
