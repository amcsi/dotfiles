#!/bin/bash
set -e
shopt -s dotglob

dotfilesDir=$(dirname $(dirname $(realpath $0)))
homeDir=$(realpath ~)

cd $dotfilesDir
cp -rv --backup=numbered * $homeDir
cp -rv --backup=numbered .dotfiles.dist/* $homeDir

