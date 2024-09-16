###############################################################################
# bash aliases
###############################################################################
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# grep with colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zenity='zenity 2>/dev/null'

# calculator
alias calc='echo -e "Python-based Calculator\nCtrl-D or quit() to quit"; \
    ipython3 -i -c="from math import *; \
    from statistics import *"'

# clear
alias c='clear'

# syntax highlighting for cat (requires bat binary)
alias cat="batcat --color=always"
alias less="less -R"

# check running daemons
alias daemons='systemctl | grep daemon'

# check loaded services
alias services='systemctl --type=service --state=running'

# use python 3 in bash
alias python="python3"
alias pip="python3 -m pip"
alias pip3="python3 -m pip"

# tmux
alias tmux="tmux -2"

# wget
alias wget='wget -N -c'

# use nvim instead of vim
alias vim="nvim"

# nvim -d for vimdiff
alias vimdiff='nvim -d'

# vim keys to exit
alias :q='exit'

# use x-terminal-emulator instead of xterm
alias xterm="x-terminal-emulator"
alias uxterm="x-terminal-emulator"
alias lxterm="x-terminal-emulator"

# usbreset-helper
alias usbreset="usbreset-helper"

# fzf
alias fzf='fzf --preview="batcat --color=always {}"'

# surfraw
alias sr='sr -browser=$BROWSERCLI'
alias surfraw='surfraw -browser=$BROWSER'

# update proxychains
alias upx='sudo fzproxy --country="Japan|Singapore|United States"'

# ventoy
alias ventoy='sudo /usr/local/bin/ventoy/Ventoy2Disk.sh'
alias usb-creator='sudo /usr/local/bin/ventoy/Ventoy2Disk.sh'

# sshuttle
alias sshu='/usr/local/sbin/sshuttle-controller'

# data about the distro
alias readme='w3m "/usr/local/share/html/readme.html"'
alias dwmkeys='w3m "/usr/local/share/html/dwmkeys.html"'
alias tmuxkeys='w3m "/usr/local/share/html/tmuxkeys.html"'
alias vimkeys='w3m "/usr/local/share/html/vimkeys.html"'
