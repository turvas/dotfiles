The dotfiles in this repo should work with bash on any platform.  The commands below are specific to setting up a new instance of OSX.

```
# Set new hostname
sudo scutil --set HostName [new hostname]

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install wget
brew install tree
brew install ag
brew install macvim
brew install chromedriver
brew install ruby
brew install python
brew install python3
brew install node
brew tap caskroom/cask
brew install brew-cask
brew cask install java
brew cask install sequel-pro
brew cask install google-chrome
brew cask install shiftit
brew cask install menumeters
brew install grails
brew install groovy
brew tap homebrew/science
brew install r
brew install Caskroom/cask/rstudio
brew linkapps
brew doctor

# PIP - Unnecessary due to "brew install python"
# sudo easy_install pip

# Vim Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git

# Configs for bash, vim, git
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.bash_profile -O ~/.bash_profile
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.gitignore -O ~/.gitignore
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# Display full path and all files in Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
killall Finder

# Install bash_it
git clone https://github.com/revans/bash-it.git ~/.bash_it
~/.bash_it/install.sh
cat ~/.bash_profile >> ~/.bash_it/aliases/enabled/general.aliases.bash

# Make workspace
mkdir ~/workspace

# Other Stuff
http://sveinbjorn.org/files/software/sloth.zip
https://github.com/downloads/onsi/ShiftIt/ShiftIt.app.zip
http://www.dejal.com/timeout/
http://www.bitgapp.com/eqmac/
http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/
```
