echo "Welcome to the world of tomorrow!"

DOTFILES=~/.dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ondrej"
ZSH_CUSTOM=$DOTFILES/zsh

# GNU utilities
# Those need to be located before `dircolors` invocation as this command is
# not available in OSX by default.
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

plugins=(git python zsh-syntax-highlighting history-substring-search brew docker pip redis-cli)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

eval $( dircolors -b $DOTFILES/.dircolors)

# aliases
alias ls='ls --color=always'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ack='ag'

if [ -f ~/.localrc ]
then
    source ~/.localrc
fi

PATH="/Users/ondrej/Library/Python/3.7/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

alias k=kubectl

export HOMEBREW_INSTALL_CLEANUP=true
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
