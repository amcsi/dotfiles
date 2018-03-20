#!/bin/bash
set -e
shopt -s dotglob

dotfilesDir=$(dirname $(dirname $(realpath $0)))
homeDir=$(realpath ~)
vimfilesDir=$homeDir/vimfiles

read -p "Install the dotfiles? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd $dotfilesDir
    # Copy all files here to the current user's home directory; backup any existing files.
    cp -rv --backup=numbered * $homeDir
    # Do the same, but with the dist folder's contents.
    cp -rv --backup=numbered .dotfiles.dist/* $homeDir
fi

cd $homeDir

read -p "Clone vimfiles? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [ -d $vimfilesDir ]
    then
        echo "$vimfilesDir exists. Backing up..."
        mv $vimfilesDir $vimfilesDir.old
    fi
    git clone git@github.com:amcsi/vimfiles.git $vimfilesDir
fi

if [ -e $vimfilesDir/bin/install.sh ]
then
    read -p "Install vimfiles? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        dotVimDir=$homeDir/.vim

        if [ -d "$dotVimDir" ]
        then
            echo "$dotVimDir exists. Backing up..."
            mv $dotVimDir $dotVimDir.old
        fi

        cd $vimfilesDir

        # Update submodules.
        git submodule update --init --recursive

        # Create symlink from .vim to vimfiles
        ln -vs vimfiles ../.vim

        # Install plugins.
        vim +PluginInstall +qall

        echo Installation complete.
    fi
fi
