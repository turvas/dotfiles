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
ln -s ${PWD}/.bash_profile ~/.bash_profile
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.ctags ~/.ctags

# Install Git completion from the official Git repo
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

echo -e "Run the following command to complete installation:\nsource ~/.bash_profile"
