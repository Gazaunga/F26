$browser=opera
$terminal=tilix
$filebrowser=nautilus

export PATH=$PATH:$HOME/.local:$PATH
export TIMEFORMAT=%R
export BROWSER=$browser
export FILEBROWSER=$filebrowser
export TERMINAL=$terminal

#Editor
if [ -x vim ] then
export EDITOR=vim
elif
if [ -x nvim ] then
export EDITOR=nvim
elif
if [ -x subl ] then
export EDITOR=subl
elif
if [ -x nano ] then
export EDITOR=nano
elif
if [ -x emacs ] then
export EDITOR=emacs
else
if [ -x rubymine ] then
export EDITOR=rubymine
end
