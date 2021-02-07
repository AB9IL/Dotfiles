###############################################################################
# bash aliases
###############################################################################
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zenity='zenity 2>/dev/null'

# clear
alias c='clear'

# syntax highlighting for cat (requires ccat binary)
alias cat="ccat --bg=dark $*"
alias ccat="ccat --bg=dark $*"

# use python 3 in bash
alias python="python3"
alias pip="python3.8 -m pip"
alias pip3="python3.8 -m pip"

# tmux
alias tmux="tmux -2"

# wget
alias wget='wget -N -c'

# use nvim instead of vim
alias vim="nvim"

# vim keys to exit
alias :q='exit'

# use x-terminal-emulator instead of xterm
alias xterm="x-terminal-emulator"
alias uxterm="x-terminal-emulator"
alias lxterm="x-terminal-emulator"

# manage wireguard
alias wgup='basename -s .conf $(ls /etc/wireguard) | fzf --preview-window=hidden | xargs -ro -d "\n" wg-quick up $*'
alias wgdn='sudo wg | grep interface | cut -f2 -d " " | fzf --preview-window=hidden | xargs -ro -d "\n" wg-quick down $*'
alias wgxfr="sudo cp -f *.conf /etc/wireguard/; sudo chmod 640 /etc/wireguard/*.conf"

# usbreset-helper
alias usbreset="usbreset-helper"

# fzf
alias fzf='fzf --preview="ccat {}"'

# surfraw
alias sr='sr -browser=$BROWSERCLI'
alias surfraw='surfraw -browser=$BROWSER'

# ventoy
alias ventoy='/usr/local/sbin/ventoy/Ventoy2Disk.sh'
alias usb-creator='/usr/local/sbin/ventoy/Ventoy2Disk.sh'
