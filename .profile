# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# qt
export QT_QPA_PLATFORMTHEME=qt5ct

# browsers
export BROWSER=x-www-browser
export BROWSERCLI=w3m

# image previews for terminal file managers
export PISTOL_CHROMA_FORMATTER=terminal256

# golang
export GOROOT=/usr/local/go
export GOPATH=~/go
export GOBIN=~/go/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin

# java
export JAVA_HOME=/usr/lib/jvm/default-java/jre

# properly start xserver
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

xset s noblank
xset s off -dpms
