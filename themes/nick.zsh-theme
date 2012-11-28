
# Build hg info for prompt using hg-prompt extension
function hg_ps1 {
  # Make sure to download the hg-prompt plugin: 
  #hg clone ssh://hg@bitbucket.org/sjl/hg-prompt
  hg prompt "{[{branch}}{status}{update}]" 2> /dev/null
}

# Colors for git prompt and the function to build it
#function git_prompt {
#  # This code from:
#  # http://vvv.tobiassjosten.net/git/add-current-git-branch-to-your-bash-prompt
#  if ! git rev-parse --git-dir > /dev/null 2>&1; then
#      return 0
#  fi
#  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
#  if git diff --quiet 2>/dev/null >&2; then
#      echo -n "${ZSH_THEME_GIT_PROMPT_CLEAN}[$git_branch]${ZSH_THEME_PROMPT_SUFFIX}"
#  else
#      echo -n "${ZSH_THEME_GIT_PROMPT_DIRTY}[$git_branch]${ZSH_THEME_PROMPT_SUFFIX}"
#  fi
#
#  #echo "[$git_color$git_branch${c_reset}]"
#  #echo "%{$git_color%}[$git_branch]%{$c_reset%}"
#}

#function git_prompt() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  #echo "$(parse_git_dirty)[${ref#refs/heads/}]$ZSH_THEME_GIT_PROMPT_SUFFIX"
#  echo "[${ref#refs/heads/}$(parse_git_dirty)]$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
function git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #echo "${ZSH_THEME_GIT_PROMPT_PREFIX}[%{$reset_color%}$(parse_git_dirty)${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_PREFIX}]${ZSH_THEME_GIT_PROMPT_SUFFIX}"
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}[${ref#refs/heads/}%{$reset_color%}$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_PREFIX}]${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Good for Tomorrow-Bright
#PROMPT='%{$fg_bold[red]%}%m%{$fg[green]%}:%{$reset_color$fg_bold[green]%}%c%{$fg_bold[yellow]%}$(hg_ps1)%{$reset_color%}$(git_prompt)%{$reset_color%}[%{$reset_color%}%{$fg_bold[cyan]%}%h%{$reset_color%}]%{$reset_color%} '
# Good for solarized (both versions)
PROMPT='%m%{$fg_bold[black]%}:%{$reset_color$fg[blue]%}%c%{$fg_bold[yellow]%}$(hg_ps1)%{$reset_color%}$(git_prompt)%{$reset_color%}%{$fg_bold[black]%}[%{$reset_color%}%{$fg[red]%}%h%{$fg_bold[black]%}]%{$reset_color%} '
#PROMPT='%m%{$fg_bold[black]%}:%{$reset_color$fg[blue]%}%c%{$fg_bold[yellow]%}$(hg_ps1)%{$reset_color%}$(git_prompt_info)%{$reset_color%}%{$fg_bold[black]%}[%{$reset_color%}%{$fg[red]%}%h%{$fg_bold[black]%}]%{$reset_color%} '
