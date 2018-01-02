override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  #Overrides the prompt_callback function used by bash-git-prompt
  function prompt_callback {
    gp_set_window_title "$(gp_truncate_pwd 20)"
    echo -n "${DimYellow}\u@\h: ${Yellow}$(gp_truncate_pwd)${ResetColor}"
  }

  GIT_PROMPT_BRANCH="${Green}"
  GIT_PROMPT_MASTER_BRANCH="${GIT_PROMPT_BRANCH}"
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=" ⭐"
  GIT_PROMPT_CHANGED=" ${Cyan}!"
  GIT_PROMPT_STAGED=" ${Yellow}▸"
  GIT_PROMPT_UNTRACKED=" ${BrightBlue}…"
  GIT_PROMPT_CONFLICTS=" ${BoldRed}?"
  GIT_PROMPT_STASHED=" ${Magenta}>"
  GIT_PROMPT_CLEAN=" ${Green}✔"
  GIT_PROMPT_SEPARATOR=""
  GIT_PROMPT_START_USER=""
  GIT_PROMPT_END_USER="\n$ "
  GIT_PROMPT_END_ROOT="\n# "
}

reload_git_prompt_colors "Custom"
