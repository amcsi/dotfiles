export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

PS1='\u:\W$(__git_ps1 "\[\e[32m\][%s]\[\e[0m\]")$ '
source "/etc/bash_completion.d/git"
source "/etc/bash_completion.d/git-prompt.sh"
export PS1='\u@\h:\w\[\033[01;33m\]$(__git_ps1)\[\033[00m\]\$ '	

alias ls="ls --color=auto"
#alias vim='gvim -v'

tmux() {
  local tmux_cmd
  if ! tmux_cmd=$(which tmux); then
    echo "error: tmux not installed" >&2
    return 1
  fi
  if ! $tmux_cmd ls > /dev/null 2>&1; then
    # tmux ls returned error, so lets try cleaning up /tmp
    /bin/rm -rf /tmp/tmux*
  fi
  $tmux_cmd "$@"
}
