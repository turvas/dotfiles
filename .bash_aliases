# .bash_aliases is included by .bashrc

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'

alias reload='source ~/.bash_profile'
alias grep='grep --color=auto'
alias cdl='cd /opt/bytelife/logstack'
uname | grep -q Darwin
if [ $? -eq 0 ]; then                   # macos, freebsd?
        alias ls='ls -G'
else                                    # any other linux, solaris bash
        alias ls='ls --color'
fi
alias l='ls -lhaF'
alias ll='ls -lhaFrt'
alias h='history'
alias hg='history | grep -i $1'
alias psef='ps -ef | head -1;  ps -ef | grep -v grep | grep --color=auto -i $1'
alias d='GLOBIGNORE=.; du -sch *; GLOBIGNORE=; shopt -u dotglob nullglob'
function f() { find . -iname "*$1*" | grep $1; }
alias eip='curl https://ifconfig.co'
# alias iip='ifconfig | grep -o "inet \(192\.168\.\d\+\.\d\+\)" | grep -o "192\.168\.\d\+\.\d\+"'
#alias iip='ifconfig | grep "inet " | tail -1 | cut -d " " -f2'
which ipconfig 2> /dev/null
if [ $? -eq 0 ]; then
        alias iip='ipconfig | grep "inet " | grep -v "127.0.0.1" | awk '"'"'{print $2}'"'"
else
        alias iip='ip addr | grep "inet " | grep -v "127.0.0.1" | awk '"'"'{print $2}'"'"
fi
alias weather='curl wttr.in/tll'
alias tag='ctags --tag-relative -R -f ./.git/tags .'
alias gdiff='git diff --color-words'
alias prod_system='echo "HOST_COLOR=\$COLOR_RED" >> ~/localvars.sh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Docker
alias doc='docker'
function dshell() { docker exec -it "$1" bash; }
alias dpa='docker ps -a'
alias dlog="docker logs $1 2>&1"


# OSX
alias off='pmset displaysleepnow'
alias index='sudo mdutil -E /'

# LINUX
# alias l='ls -lhaF --color=auto'
# alias ll='ls -lhaFrtG --color=auto'

