# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Use plink (putty) on WSL.
if [ -d "/mnt/c/Program Files/PuTTY" ] ; then
    export GIT_SSH="/mnt/c/Program Files/PuTTY//plink.exe"
fi

# To solve issue with PhpStorm stopping listening to keyboard events.
# https://askubuntu.com/a/731548/176014
export IBUS_ENABLE_SYNC_MODE=1

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

dex() {
    docker exec -it "$1" /bin/bash
    echo "$1"
}

export PATH="$HOME/.cargo/bin:$PATH"


# Added by Toolbox App
export PATH="$PATH:/home/attila/.local/share/JetBrains/Toolbox/scripts"