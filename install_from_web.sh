#!/bin/bash
# meant for onliner install, like
# curl -L https://github.com/turvas/dotfiles/raw/master/install_from_web.sh | sh
#
set -e
which git > /dev/null
if [ $? -gt 0 ]; then # missing
	OS=`uname | awk '{print $1}'`
	if [ "$OS" = "Linux" ]; then	# need more exact flavor
        	OS=$(cat /etc/*release | grep '^ID=' | cut -c 4- | sed "s/\"//g")
	fi
	echo Installing for: $OS
        if [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ]; then
                sudo apt update
                sudo apt install -y git
	elif [ "$OS" = "FreeBSD" ]; then
		echo y | sudo pkg install git
        else	# centos, fedore rhel
                sudo yum install -y git
        fi
fi
if [ -z "$1" ]; then
	GIT_REPO=turvas@github.com/turvas
else
	GIT_REPO=$1
fi
git clone https://$GIT_REPO/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install_dotfiles.sh # Don't worry, this will preserve existing dotfiles with timestamps!
source ~/.bash_profile # Apply new dotfiles to current shell
