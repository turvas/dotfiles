PS1='\n\e[0;32m\]\u@\h:\w\n$ \[\e[m\]'

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

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

