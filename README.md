The dotfiles in this repo should work with bash on any platform.  The commands below are specific to setting up a new instance of OSX.

```bash
# Set new hostname
sudo scutil --set HostName [new hostname]

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew tap homebrew/science
brew tap caskroom/cask

brew install gcc
brew install ctags
brew install ag
brew install pv
brew install tree
brew install wget
brew install httpie
brew install unrar
brew install unar
brew install node
brew install python
brew install python3
brew install r
brew install ruby
brew install postgres
brew install findutils
brew install fortune
brew install sox # play -n synth 5 sine 440
brew install ffmpeg
brew install heroku/brew/heroku

brew cask install eqmac
brew cask install flux
brew cask install google-chrome
brew cask install firefox
brew cask install grandperspective
brew cask install iterm2
brew cask install java
brew cask install menumeters
brew cask install rstudio
brew cask install shiftit
brew cask install slack
brew cask install sloth
brew cask install sonos
brew cask install spotify
brew cask install steam
brew cask install textmate
brew cask install vlc
brew cask install ngrok
brew cask install menubar-countdown
brew cask install accessmenubarapps

brew linkapps
brew cleanup
brew cask cleanup
brew doctor

npm install -g vtop

# Optional packages
#brew install macvim
#brew install chromedriver
#brew cask install sequel-pro

# PIP - Unnecessary due to "brew install python"
#sudo easy_install pip
pip3 install --user --upgrade awscli
pip3 install requests
pip install requests
pip3 install pylint
pip install pylint
pip install numpy
pip3 install numpy
pip install ipython
pip3 install ipython
pip install jupyter
pip3 install jupyter
pip install pandas
pip3 install pandas

brew install gfortran
pip install scipy
pip3 install scipy

brew install pkg-config
pip install matplotlib
pip3 install matplotlib

# XCode
sudo gem install cocoapods
mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes
wget https://raw.githubusercontent.com/mitochondrion/XcodePreferences/master/FontAndColorThemes/akitchen_12.dvtcolortheme -O ~/Library/Developer/Xcode/UserData/FontAndColorThemes/akitchen_12.dvtcolortheme
wget https://raw.githubusercontent.com/mitochondrion/XcodePreferences/master/FontAndColorThemes/akitchen_13.dvtcolortheme -O ~/Library/Developer/Xcode/UserData/FontAndColorThemes/akitchen_13.dvtcolortheme
wget https://raw.githubusercontent.com/mitochondrion/XcodePreferences/master/FontAndColorThemes/akitchen_14.dvtcolortheme -O ~/Library/Developer/Xcode/UserData/FontAndColorThemes/akitchen_14.dvtcolortheme

# Vim Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/ryanss/vim-hackernews
git clone https://github.com/bronson/vim-trailing-whitespace
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/ervandew/supertab

# Configs for bash, vim, git
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.bash_profile -O ~/.bash_profile
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/mitochondrion/dotfiles/master/.gitignore -O ~/.gitignore
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# Display full path and all files in Finder
defaults write com.apple.finder AppleShowAllFiles -boolean true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
killall Finder

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Create workspace directory
mkdir ~/workspace

# Other Stuff
https://github.com/downloads/onsi/ShiftIt/ShiftIt.app.zip (Old version had better hotkeys)
http://www.dejal.com/timeout/
http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/
Wunderlist
Slack
Postman
Charles Proxy

# Chrome Plugins
HTTPS Everywhere
Privacy Badger
JSON Viewer
Zhongwen Chinese Popup Dictionary
Pocket
The Great Suspender
appear.in
```
