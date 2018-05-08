# Dotfiles

Set of my personal dotfiles. Feel free to use any part you find useful. Do not
install those as-is as there are several specific personal settings (as git
name and email).


## What dotfiles does it contain?

* zsh
* git
* vim
* Visual Studio Code


## Installation

* Clone this repo to convenient directory:
  `git clone git://github.com/ondrowan/dotfiles.git ~/.dotfiles`
* Symlink any dotfiles you like to home directory. Eg. `.zshrc` to `~/.zshrc`:
  `ln -s ~/.dotfiles/.zshrc ~/.zshrc`


### zsh

* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Init and update submodules: `git submodule update --init`
* Make zsh default shell: `` chsh -s `which zsh` ``
* Logout and login again


### vim

* Clone [vundle](https://github.com/gmarik/Vundle.vim): `git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/bundle/Vundle.vim`
* Install all plugins: `vim +PluginInstall +qall` (or from within vim: `:PluginInstall`)


### Visual Studio Code

* Symlink VSCode settings: `ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json`
* Install extensions: `cat ~/.dotfiles/vscode/extensions | xargs -n1 code --install-extension`


## Extending .zshrc

`.zshrc` always sources `.localrc` if it exists. Put whatever additional aliases or commands there.
`.localrc` is the last thing in `.zshrc`, so feel free to override anything you don't like also.

If you wish to extend `PATH`, you should do it in `~/.zshenv` as it's sourced on every shell invocation.
