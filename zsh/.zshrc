# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled  # disable automatic updates

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git rust)

source $ZSH/oh-my-zsh.sh

###################################################
# my conf

# vim motions
bindkey -v

# default (Emacs)
# bindkey -e

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# override color of suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green,bold'

# alias
alias sus="systemctl suspend"
alias nv="nvim"
alias dot="cd ~/.dotfiles"
alias code="cd ~/git/code"
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export MANPAGER=less

# proxy
alias prx="proxychains -q -f ~/.dotfiles/proxychains.conf"

#fzf
alias fzfv='fzf --bind "ctrl-o:execute(vlc {})"'  
alias fzfb='fzf --bind "ctrl-o:execute(evince {})"'  
alias fzf='fzf --bind "ctrl-o:execute(nvim {})"'  

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/bin

# starship config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# starship
eval "$(starship init zsh)"

