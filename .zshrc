# Plugins for zsh
plugins=(zoxide git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# sourcing all the env vars and aliases
source ~/.zshenv
source ~/.zshaliases

# ssh authentication
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# editor preference for local and remote session
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship init
eval "$(starship init zsh)"

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
