#!/usr/bin/env bash

#some original files may miss, and thus on mv whole script is interrupted
#set -e 
# no pipe cmds here
#set -o pipefail

# cd location of .dotfiles/install...sh  dir
cd "${0%/*}"

NOW=`date "+%Y%m%d%H%M%S"`
# rename (or unlink) to keep existing configs and link new ones
function link_file {
        FILE=$1
        if [ -L ~/$FILE ]; then   # symbolik link to be removed (also -h), to enable reinstall
                echo Unlinking $FILE
                unlink ~/$FILE
        fi
        if [ -f ~/$FILE ]; then
                echo Backuping $FILE
                mv ~/$FILE ~/$FILE.$NOW
                if [ $FILE == '.bashrc' ]; then # needed/included later by new .bashrc
                        ln -sn ~/$FILE.$NOW ~/.bashrc.original
                fi
        fi
        ln -sn ${PWD}/$FILE ~/$FILE
}

FILES=".bash_profile .bashrc .bash_aliases .vimrc .gitconfig .gitignore"
for file in $FILES; do
        echo Linking file $file
        link_file $file
done

mkdir -p ~/.vim/colors
[ ! -L ~/.vim/colors/kalev.vim ] && ln -sn ${PWD}/kalev.vim ~/.vim/colors/kalev.vim
# no need to load darkspace, exist in local repo
#curl -O https://raw.githubusercontent.com/niklas-8/vim-darkspace/master/colors/darkspace.vim
[ ! -L ~/.vim/colors/darkspace.vim ] && ln -sn ${PWD}/darkspace.vim ~/.vim/colors/darkspace.vim

# Install Git completion from the official Git repo
which wget > /dev/null
if [ $? -gt 0 ]; then # missing
	OS=`uname | awk '{print $1}'`
	if [ "$OS" = "Linux" ]; then	# need more exact flavor
        	OS=$(cat /etc/*release | grep '^ID=' | cut -c 4- | sed "s/\"//g")
	fi
        if [ $OS == 'ubuntu' ] || [ $OS == 'debian' ]; then
                sudo apt -y install wget
        elif [ "$OS" = "FreeBSD" ]; then
		echo y | sudo pkg install wget
        else
                sudo yum -y install wget
        fi
fi
wget --no-check-certificate https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

cd ~
git clone https://github.com/so-fancy/diff-so-fancy.git
mkdir -p .local/bin/lib
cp diff-so-fancy/diff-so-fancy .local/bin/
cp diff-so-fancy/lib/DiffHighlight.pm .local/bin/lib/DiffHighlight.pm

# preps for vim docker-safe
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

echo -e "Run the following command to activate it:\nsource ~/.bash_profile"
