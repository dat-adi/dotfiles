set TERM "xterm-256color"
set XDG_USER_CONFIG_DIR "$HOME/.config"
set XDG_CONFIG_HOME "$HOME/.config"
set XDG_DATA_HOME "$HOME/.local/share"

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
alias p "paru"

# configuration shortcuts
alias fishconf "nvim ~/.config/fish/config.fish"
alias qtileconf "nvim ~/.config/qtile/"
alias roficonf "nvim ~/.config/rofi/config.rasi"
alias nvimconf "nvim ~/.config/nvim/init.vim"
alias reload "source ~/.config/fish/config.fish"

starship init fish | source
if test -f /home/dat-adi/.autojump/share/autojump/autojump.fish;
    . /home/dat-adi/.autojump/share/autojump/autojump.fish;
end
