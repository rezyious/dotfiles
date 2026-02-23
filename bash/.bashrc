PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
# xterm-color | *-256color) color_prompt=yes ;;
# esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;38m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\W\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


# vi mode
set -o vi
# set -o emacs # default emacs mode

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# go
export GO_BIN_PATH="/usr/local/go/bin"
case ":$PATH:" in
*":$GO_BIN_PATH:"*) ;;
*) PATH="$GO_BIN_PATH:$PATH" ;;
esac

# my scripts
export MY_SCRIPTS="$HOME/.dotfiles/scripts/" 
case ":$PATH:" in
*":$MY_SCRIPTS:"*) ;;
*) PATH="$MY_SCRIPTS:$PATH" ;;
esac

export MY_BIN_PATH="$HOME/bin/"
case ":$PATH:" in
*":$MY_BIN_PATH:"*) ;;
*) PATH="$MY_BIN_PATH:$PATH" ;;
esac

# # pnpm
export PNPM_HOME="/home/reza/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) PATH="$PNPM_HOME:$PATH" ;;
esac
# # pnpm end

# nvm - node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#cargo
. "$HOME/.cargo/env"


alias nv="nvim"
alias prx="proxychains -q -f ~/.dotfiles/configs/proxychains.conf"
alias yt="yt-dlp --config-location ~/.dotfiles/configs/yt-dlp.conf"
alias dot="cd $HOME/.dotfiles/"
alias src="source ~/.bashrc"
alias ll="ls -lah --color=auto"
alias path="echo $PATH | tr \":\" \"\n\" "

pp="--proxy=10.111.197.66:8080"

# flathub aliases
alias pwvucontrol="flatpak run com.saivert.pwvucontrol"
alias telegram="flatpak run org.telegram.desktop"

# fzf
fzf_nvim() {
    local file
    file=$(fd --type f | fzf \
        --preview 'bat --style=numbers --color=always {}') || return
    nvim "$file"
}

bind -x '"\C-p": fzf_nvim'

bind -x '"\C-l": clear'
################################################################################
#                               funcs                                          #
################################################################################

get_info() {
    echo "TIME : $(date '+%A-%d-%B-%Y == %H:%M')"
    echo "UPTIME : $(uptime -p)"
    echo "DISK USAGE : $(df -h | grep root | cut -d ' ' -f3- | cut -d '/' -f1)"
}

local_ipv4() {
    ip a | grep -E 'inet\b' | grep -v 127.0.0.1 | sed -E 's/.*inet //' | cut -d" " -f1 | cut -d"/" -f1
}

ping_pacman_mirrors() {

    echo "pingning pacman mirrorlist"
    echo

    IFS_OLD=$IFS
    IFS=$'\n'
    SERVER_NUMBER=1
    for line in $(cat /etc/pacman.d/mirrorlist); do
        if [ $(echo $line | grep -v "#") ]; then # not interested in comments
            server=$(echo $line | sed -E 's/.*=[[:space:]]//' | cut -d "/" -f2-3 | sed 's/\///')
            echo "################################################################################"
            echo SERVER $SERVER_NUMBER
            echo "pingning $server"
            ping -c 4 -n $server
            sleep 1
            SERVER_NUMBER=$(($SERVER_NUMBER + 1))
            echo
        fi
    done
}
