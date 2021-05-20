#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export NVM_DIR="/home/dat-adi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

~/.config/startup-scripts/fm6000 -r
eval "$(starship init bash)"

source ~/Code/shell-scripts/youtube-dl-audio
