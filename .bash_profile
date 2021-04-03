# .bash_profile executed by bash(1) for login shells (ssh, etc).
# good for commands, which should be exec-d once per login, like PATH env

# Default editor is vi which breaks things like crontab
export EDITOR=vim

# majority config is in non-login shell config:
. ~/.bashrc

### PATH ###
export PATH=~/.local/bin:$PATH