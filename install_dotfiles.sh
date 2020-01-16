#!/bin/bash

set -e 
set -o pipefail

cd "${0%/*}"

# Move and save existing configs
NOW=`date "+%Y%m%d%H%M%S"`

# On Linux you can add the "mv --backup=t" flag for even more safety, but it's not available on OSX :(
mv ~/.bash_profile ~/.bash_profile.$NOW
mv ~/.vimrc ~/.vimrc.$NOW
mv ~/.gitconfig ~/.gitconfig.$NOW
mv ~/.gitignore ~/.gitignore.$NOW
#mv ~/.ctags ~/.ctags.$NOW

# Create symlinks to repository dotfiles
ln -sn ${PWD}/.bash_profile ~/.bash_profile
ln -sn ${PWD}/.vimrc ~/.vimrc
ln -sn ${PWD}/.gitconfig ~/.gitconfig
ln -sn ${PWD}/.gitignore ~/.gitignore
#ln -sn ${PWD}/.ctags ~/.ctags

# Install Git completion from the official Git repo
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

echo -e "Run the following command to complete installation:\nsource ~/.bash_profile"
