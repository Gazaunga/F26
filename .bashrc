# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f ~/.bash_env ] && source ~/.bash_env

[ -f ~/.bash_functions ] && source ~/.bash_functions

if [ "$TERM" = "screen" ]; then
    export TERM=screen-256color
fi

source ~/bash/bash_commands
source ~/bash/exports
source ~/bash/git_commands
source ~/bash/paths
