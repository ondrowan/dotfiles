echo "Welcome to the world of tomorrow!"

DOTFILES=~/.dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ondrej"
ZSH_CUSTOM=$DOTFILES/zsh

plugins=(git python django)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/home/ondrej/.pythonbrew/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
