
# .bash_profile executed by bash(1) for login shells (ssh, etc).
# good for commands, which should be exec-d once per login, like PATH env

# Default editor is vi which breaks things like crontab
export EDITOR=vim

# majority config is in non-login shell config:
. ~/.bashrc

### PATH ### , added ansible path
OS=`uname`
if [ $OS != 'Darwin' ]; then    # Linux
        export PATH=~/.local/bin:$PATH
else    # Mac
        export PATH=~/.local/bin:~/flutter/bin:~/Library/Python/3.8/bin:$PATH
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ##
        # Your previous /Users/kalev/.bash_profile file was backed up as /Users/kalev/.bash_profile.macports-saved_2022-03-31_at_15:36:51
        ##
        # MacPorts Installer addition on 2022-03-31_at_15:36:51: adding an appropriate PATH variable for use with MacPorts.
        export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

        # MacPorts Installer addition on 2022-03-31_at_15:36:51: adding an appropriate MANPATH variable for use with MacPorts.
        export MANPATH="/opt/local/share/man:$MANPATH"

        # ansible fork jaoks MacOS peal
        export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

        test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi
