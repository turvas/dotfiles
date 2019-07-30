#!/bin/bash

cd "${0%/*}"

# Move and save existing configs
TODAY=`date "+%Y%m%d"`

mv ~/.bash_profile ~/.bash_profile.$TODAY
mv ~/.vimrc ~/.vimrc.$TODAY
mv ~/.gitconfig ~/.gitconfig.$TODAY
mv ~/.gitignore ~/.gitignore.$TODAY
mv ~/.ctags ~/.ctags.$TODAY

# Create symlinks to repository dotfiles
ln -s ~/.bash_profile ${PWD}/.bash_profile
ln -s ~/.vimrc ${PWD}/.vimrc
ln -s ~/.gitconfig ${PWD}/.gitconfig
ln -s ~/.gitignore ${PWD}/.gitignore
ln -s ~/.ctags ${PWD}/.ctags

# Install Git completion from the official Git repo
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
