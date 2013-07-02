echo "Welcome to the world of tomorrow!"

DOTFILES=~/.dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ondrej"
ZSH_CUSTOM=$DOTFILES/zsh

plugins=(git python django symfony2 zsh-syntax-highlighting composer history-substring-search)

source $ZSH/oh-my-zsh.sh

# python virtual env wrapper
if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/.virtualenvs
    source ~/.local/bin/virtualenvwrapper.sh
    plugins=("${plugins[@]}" virtualenvwrapper)
fi

# pythonbrew
[[ -s ~/.pythonbrew/etc/bashrc ]] && source ~/.pythonbrew/etc/bashrc

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

eval $( dircolors -b $DOTFILES/LS_COLORS)

# tmux
function safe_tmux() {
    if command -v deactivate > /dev/null 2>&1; then
        deactivate
    fi
    TERM=xterm-256color \tmux;
}

alias tmux='safe_tmux'

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.localrc ]
then
    source ~/.localrc
fi
