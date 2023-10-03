# Variables for cargo (rust)
. "$HOME/.cargo/env"

# PATH change
export PATH="$HOME/bin:/home/dat-adi/.local/bin:$PATH"

# Go path
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# oh-my-zsh installation path
export ZSH="/home/dat-adi/.oh-my-zsh"

# Setting up terminal and system configurations
set TERM="xterm-256color"
set XDG_USER_CONFIG_DIR="$HOME/.config"
set XDG_CONFIG_HOME="$HOME/.config"
set XDG_DATA_HOME="$HOME/.local/share"

# Language environment
export LANG=en_US.UTF-8
