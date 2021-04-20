set TERM "xterm-256color"
set XDG_USER_CONFIG_DIR "$HOME/.config"
set XDG_CONFIG_HOME "$HOME/.config"
set XDG_DATA_HOME "$HOME/.local/share"
set XDG_DATA_DIRS "$HOME/.config"

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

# files
alias cat='bat'
alias sl='ls -la'

# appimages
alias obsidian='/usr/local/bin/Obsidian-0.11.9.AppImage'

# browser
alias viv='vivaldi-stable'

# editors
alias n='nvim'
alias vi='nvim'

# xampp
alias xampp-start='sudo /opt/lampp/lampp start'
alias xampp-stop='sudo /opt/lampp/lampp stop'

