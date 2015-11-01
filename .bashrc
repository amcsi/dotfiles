export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"


# Include git stuff
if [ -f /etc/bash_completion.d/git-prompt.sh ]; then
    . /etc/bash_completion.d/git-prompt.sh
fi
if [ -f /etc/bash_completion.d/git-prompt ]; then
    . /etc/bash_completion.d/git-prompt
fi

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

alias d=docker
alias dc=docker-compose
