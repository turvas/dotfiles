#!/bin/bash

cd "${0%/*}"

# Move and save existing configs
NOW=`date "+%Y%m%d%H%M%S"`

mv --backup=t ~/.bash_profile ~/.bash_profile.$NOW
mv --backup=t ~/.vimrc ~/.vimrc.$NOW
mv --backup=t ~/.gitconfig ~/.gitconfig.$NOW
mv --backup=t ~/.gitignore ~/.gitignore.$NOW
mv --backup=t ~/.ctags ~/.ctags.$NOW

# Create symlinks to repository dotfiles
ln -s ${PWD}/.bash_profile ~/.bash_profile
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.ctags ~/.ctags

# Install Git completion from the official Git repo
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

echo -e "Run the following command to complete installation:\nsource ~/.bash_profile"
