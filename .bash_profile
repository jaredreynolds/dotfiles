# Use this .bash_profile for customizations.
# This file is loaded from ~/.bash_profile,
# which is owned by the daptiv dotfiles repository

export USER_PROFILE_LOADED="1"
export PATH=$PATH:/usr/local/sbin:~/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export DB_SERVER_NAME=WIN-2012R2

alias yarnl="yarn install --pure-lockfile"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/jreynolds/.nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
if [ -f "$__GIT_PROMPT_DIR/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Custom
  GIT_PROMPT_THEME_FILE=~/.dotfiles/files/git-prompt-theme.sh
  source "$__GIT_PROMPT_DIR/gitprompt.sh"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# from bash-completion@2 formula
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
