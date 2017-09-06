
# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# save package list from one system and install them on another
rpm -qa --qf "%{NAME}\n" > package-list
sudo dnf install $(cat package-list | tr '\n' ' ')

# Get my IP address using HTTPS.
alias httpsip='curl -s https://4.ifcfg.me/'

alias fuck="sudo !!"

alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias exe='sudo chmod +x'

# make `less` not clear the screen upon exit
alias less='less -X'

alias n='nano'

alias weather='curl http://wttr.in/http://wttr.in/Baltimore'

alias _='sudo'

alias home='cd ~'

alias work='pomodoro &'

alias scripts="cd ~/.local/usr/bin/.scripts"

alias append="echo '$1' | sudo tee -a '$2'"

alias glg='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate'
alias glgh='git log --graph --pretty=format":%C(yellow)%h%Cblue%d%Creset %s %C(white) %an,%ar%Creset" --abbrev-commit --decorate | head'
alias glo='git log --oneline --decorate'
alias gloh='git log --oneline --decorate | head'

alias htop="glances -w"
