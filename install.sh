#!/bin/bash

set -e

dest=$1

if [ -z "$dest" ]; then
  dest=$HOME
fi

dir=`dirname "$0"`

pwd=`cd "$dir" > /dev/null 2>&1 && pwd`

echo "Linking from $pwd to $dest"

ln -sfv $pwd/.irbrc $dest
ln -sfv $pwd/.gitconfig $dest
ln -sfv $pwd/.githelpers $dest
ln -sfv $pwd/.gitignore $dest
ln -sfv $pwd/.tmux.conf $dest
ln -sfv $pwd/.vimrc $dest
ln -sfv $pwd/.zshrc $dest
ln -sfv $pwd/.zprofile $dest
ln -sfv $pwd/.bashrc $dest
ln -sfv $pwd/.bash_profile $dest
ln -sfv $pwd/.Xresources $dest
