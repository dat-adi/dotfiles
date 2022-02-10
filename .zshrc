# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dat-adi/.oh-my-zsh"

# Plugins for zsh
plugins=(git fzf zsh-autosuggestions fasd)

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Setting up terminal and system configurations
set TERM="xterm-256color"
set XDG_USER_CONFIG_DIR="$HOME/.config"
set XDG_CONFIG_HOME="$HOME/.config"
set XDG_DATA_HOME="$HOME/.local/share"

# files
alias cat='bat -p'
alias ls='exa'
alias sl='exa -la'
alias grep='rg'
alias rm='trash-put'

# editors
alias vi='nvim'

# AUR helper
alias p="paru"

# configuration shortcuts
alias zshconf="nvim ~/dotfiles/.zshrc"
alias fishconf="nvim ~/.config/fish/config.fish"
alias qtileconf="nvim ~/.config/qtile/"
alias roficonf="nvim ~/.config/rofi/config.rasi"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias reload="source ~/dotfiles/.zshrc"

# Setting up SSH for git?
export SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initializing new SSH agent ..."
    ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
}

function test_identities {
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]; then
        ssh-add
        if [ $status -eq 2 ]; then
            start_agent
        fi
    fi
}

if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]; then
        test_identities
    fi
else
    if [ -f $SSH_ENV ]; then
        . $SSH_ENV > /dev/null
    fi
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null

    if [ $status -eq 0 ]; then
        test_identities
    else
        start_agent
    fi
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
eval "$(fasd --init auto)"
source /usr/share/nvm/init-nvm.sh
