PS1='\n\e[0;32m\]\u@\h:\w\n$ \[\e[m\]'

alias grep='grep --color=auto'
alias l='ls -lhaFG'
alias ll='ls -lhaFrtG'
alias h='history'
alias gh='history | grep -i $1'
alias psef='ps -ef | head -1;  ps -ef | grep -v grep | grep --color=auto -i $1'
alias d='du -sch ./*'
alias f='find . -iname $1'

# LINUX
# alias l='ls -lhaF --color=auto'
# alias ll='ls -lhaFrtG --color=auto'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Mac specific aliases
alias aliases='vim ~/.bash_it/aliases/enabled/general.aliases.bash'

if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    bind "set completion-ignore-case on"
    bind "set show-all-if-ambiguous on"
fi
