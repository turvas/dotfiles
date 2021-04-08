# ~/.bashrc: executed by bash(1) for non-login interactive shells, like GNU terminal, included by .bash_profile.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

### History is handled more down below
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# For Java installed via Homebrew
#export JAVA_HOME="$(/usr/libexec/java_home)"

function f() { find . -iname "*$1*" | grep $1; }
function dshell() { docker exec -it "$1" bash; }
#check, if exists and running
docker ps > /dev/null 2>&1
if [ $? -eq 0 ]; then # if docker is running
        RESP=`docker stack ls 2> /dev/null`
        #echo $RESP
        if [ $? -eq 0 ]; then
                export STACKNAME=$(echo "$RESP" | grep Swarm | awk '{print $1}')
                echo "Logstack swarm name (STACKNAME): $STACKNAME"
        fi
fi

# Change default ls directory color to be readable on dark background
# (OSX)
export LSCOLORS='Exfxcxdxbxegedabagacad'
# (LINUX)
export LS_COLORS=$LS_COLORS:'di=0;35:'

### HISTORY ###
# no duplicate entries
export HISTCONTROL=ignoredups:erasedups
# big big history
export HISTSIZE=100000
export HISTFILESIZE=100000
# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Useful timestamp format
export HISTTIMEFORMAT='%F %T '
# append to history, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist

### GIT COMPLETION ###
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### HISTORY PARTIAL COMPLETION ###
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    bind "set completion-ignore-case on"
    bind "set show-all-if-ambiguous on"
fi

# host alive checker with only changes shown
alive() {
    LAST_RET=0  # assume ok
    while (true); do
        d=`date`
        ping -c 1 -W 1 "$1" > /dev/null
        RET=$?
        #echo RET=$RET , LAST_RET=$LAST_RET
        if [ $RET -eq $LAST_RET ]; then     # same as from pevious time
                CTR='\r\033[1A\033[0K'             # clear line
        else
                CTR=                        # no clearing, normal newline
        fi
#        echo $CTR
        if [ $RET -eq 0 ]; then
                echo -e "$CTR $d $1 is alive"
        else
                echo -e "$CTR $d $1 is pining for the fjords"
        fi
        LAST_RET=$RET
        sleep 1
    done
}

### EXPLAINSHELL ###
# Open a command in http://explainshell.com/: explain [command]
# From: https://github.com/schneems/explain_shell
function explain {
  # base url with first command already injected
  # $ explain tar
  #   => http://explainshel.com/explain/tar?args=
  url="http://explainshell.com/explain/$1?args="

  # removes $1 (tar) from arguments ($@)
  shift;

  # iterates over remaining args and adds builds the rest of the url
  for i in "$@"; do
    url=$url"$i""+"
  done

  # opens url in browser
  open $url
}

### 1337 PS1 PROMPT ###
COLOR_RED="\[\033[0;31m\]"
COLOR_RED_BOLD="\[\033[1;31m\]"
COLOR_GREEN="\[\033[0;32m\]"
COLOR_GREEN_LIGHT="\[\033[0;92m\]"
COLOR_YELLOW="\[\033[0;33m\]"
COLOR_BLUE="\[\033[0;34m\]"
COLOR_BLUE_LIGHT="\[\033[0;94m\]"
COLOR_MAGENTA="\[\033[0;35m\]"
COLOR_CYAN="\[\033[0;36m\]"
COLOR_CYAN_LIGHT="\[\033[0;96m\]"
COLOR_WHITE="\[\033[0;37m\]"

COLOR_RESET="\[\033[0m\]"
# 88/256 color terminals
COLOR_OCHRE="\[\033[38;5;95m\]"

# load local variables and overrides (not part of git repo)
LOCALVARS=~/localvars.sh
if [ -f $LOCALVARS ]; then
        source $LOCALVARS
fi
if [ -z ${HOST_COLOR+x} ]; then # if variable is set
        HOST_COLOR=$COLOR_GREEN
fi

function git_status_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes not staged" ]] ; then
    echo $COLOR_RED_BOLD
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo $COLOR_CYAN
  elif [[ $git_status =~ "Your branch is behind" ]] || [[ $git_status =~ "different commits each" ]]; then
    echo $COLOR_YELLOW
  elif [[ $git_status =~ "untracked files present" ]]; then
    echo $COLOR_GREEN_LIGHT
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo $COLOR_GREEN
  else
    echo $COLOR_OCHRE
  fi
}

function colored_git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "$COLOR_GREEN|$(git_status_color)$branch$COLOR_GREEN| "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "$COLOR_GREEN|$(git_status_color)$commit$COLOR_GREEN| "
  fi
}

function set_bash_prompt {
  PS1="\n"
  # timestamp
  PS1+="$COLOR_GREEN|$COLOR_BLUE\t \u @ $HOST_COLOR \H $COLOR_GREEN|"
  # path
  PS1+=" $COLOR_CYAN\w"
  if [ -n "$VIRTUAL_ENV" ]; then PS1+=" (venv)"; fi
  PS1+="\n"
  # git branch/status
  PS1+="$(colored_git_branch)"
  PS1+="> $COLOR_RESET "
}

PROMPT_COMMAND=set_bash_prompt

# temp web storage transfer.sh
transfer() {
        if [ $# -eq 0 ]; then
                echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
                return 1;
        fi
        tmpfile=$( mktemp -t transferXXX );
        if tty -s; then
                basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
                curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
        else
                curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
        fi;
        cat $tmpfile;
        rm -f $tmpfile;
}


# 😃 🍕 🍔 ⚓ ☠  ♠️ ♣️ ♥️ ♦️ ⚜ 💊 ☠ 💎 ⛵️ 🐓 🔥 💥 👉 💩 🌎 🍍 🛡 💡 ✏️ 💾 ⚙ ☢ 🌀 🌐 ▶️ ➡️ 🀄️ 🔴 🔵

# brew versions are newer, but less features
# export PATH="/usr/local/opt/curl/bin:$PATH"
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
