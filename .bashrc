# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# include .profile
if [ -f "$HOME/.profile" ]; then
. "$HOME/.profile"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Show git changes in PS1
export GIT_PS1_SHOWDIRTYSTATE=1
# Do not show stashed changes in PS1
export GIT_PS1_SHOWSTASHSTATE=
export GIT_PS1_SHOWCOLORHINTS="true"

# https://stackoverflow.com/a/43142926/1381550
fast_git_ps1 ()                                                                              
{                                                                                            
    printf -- "$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/ (\1) /')"    
}                                                                                            


unamestr=`uname`
if [[ "$unamestr" == MINGW* ]] ; then
    my_ps1 ()
    {
        fast_git_ps1
    }
else
    my_ps1 ()
    {
        __git_ps1
    }
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    PROMPT_COMMAND="my_ps1 '\u@\h:\w' '\\$ '"
else
    if [ -f /etc/bash_completion.d/git-prompt.sh ]; then
        . /etc/bash_completion.d/git-prompt.sh
    fi
    if [ -f /etc/bash_completion.d/git-prompt ]; then
        . /etc/bash_completion.d/git-prompt
    fi
    export PS1='\u@\h:\w\[\033[01;33m\]$(my_ps1)\[\033[00m\]\$ '
fi

alias ls="ls --color=auto"

if hash fuck 2>/dev/null; then
    eval $(thefuck --alias)
fi

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

export PATH="$PATH:~/.composer/vendor/bin:~/.config/composer/vendor/bin:/opt/mssql-tools/bin"

alias d=docker
alias dc='docker-compose --x-networking'
alias gsts='git stash show --text'

dex() {
    docker exec -it "$1" /bin/bash
    echo "$1"
}

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# Makes git bash on Windows integrated with PhpStorm work with accented chars
export LC_CTYPE=C.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VOLTA_HOME="$HOME/.volta"
# Do export ENABLE_VOLTA=1 in .bashrc.local to enable volta.
if [[ -n "$ENABLE_VOLTA" ]]; then
    [ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi
