Dotfiles
========

Set of useful dotfiles (not just) for fresh *nix installs.


What dotfiles does it contain?
------------------------------

* zsh config


Installation
------------

* Clone this repo to convenient directory: `git clone git://github.com/ondrowan/dotfiles.git ~/.dotfiles`
* Init and update submodules: `git submodule update --init`
* Symlink any dotfiles you like to home directory. Eg. .zshrc to ~/.zshrc: `ln -s ~/.dotfiles/.zshrc ~/.zshrc`
* Make zsh default shell: `` chsh -s `which zsh` ``
* Logout and login again
* Enjoy shinies


Extending .zshrc
----------------

`.zshrc` always sources `.localrc` if it exists. Put whatever additional aliases or commands there.
`.localrc` is the last thing in `.zshrc`, so feel free to override anything you don't like also.

If you wish to extend `PATH`, you should do it in `~/.zshenv` as it's sourced on every shell invocation.
