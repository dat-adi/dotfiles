# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dat-adi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
plugins=(git fzf zsh-autosuggestions fasd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

set TERM="xterm-256color"
set XDG_USER_CONFIG_DIR="$HOME/.config"
set XDG_CONFIG_HOME="$HOME/.config"
set XDG_DATA_HOME="$HOME/.local/share"

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias cim='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'
alias setssh='git remote set-url origin'

# files
alias cat='bat'
alias ls='exa'
alias sl='exa -la'
alias grep='rg'
alias dvsw='cd ~/Documents/VIT/Sophomore/WinterSemester/'
alias rm='trash-put'

# browser
alias viv='vivaldi-stable'

# editors
alias n='nvim'
alias vi='nvim'

# xampp
alias xampp-start='sudo /opt/lampp/lampp start'
alias xampp-stop='sudo /opt/lampp/lampp stop'

# AUR helper
alias p="paru"

# configuration shortcuts
alias fishconf="nvim ~/.config/fish/config.fish"
alias qtileconf="nvim ~/.config/qtile/"
alias roficonf="nvim ~/.config/rofi/config.rasi"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias reload="source ~/.config/fish/config.fish"

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
