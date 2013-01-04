set -e

USER=`whoami`
CODE=~/Code
SITES=~/Sites
DOTFILES=~/.dotfiles

if [ ! -d $CODE ]; then
    echo "\033[0;34mCreating $CODE directory...\033[0m"
    mkdir $CODE
fi

if [ ! -d $SITES ]; then
    echo "\033[0;34mCreating $SITES directory...\033[0m"
    mkdir $SITES
fi

# stuff
sudo apt-get install git vim zsh pidgin ack curl mc python-setuptools apache2 mysql-server postgresql php5 php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mysqlnd php5-pgsql php5-sqlite php5-suhosin php5-xdebug

# pip & virtualenv

if command -v pip > /dev/null 2>&1; then
    echo "\033[0;34mInstalling pip...\033[0m"
    sudo easy_install pip
fi

sudo pip install virtualenv virtualenvwrapper

# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "\033[0;34mFolder .oh-my-zsh already exists and it's being removed...\033[0m"
    rm -rf ~/.oh-my-zsh
fi

echo "\033[0;34mCloning oh-my-zsh...\033[0m"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv -b ~/.zshrc ~/.zshrc.bak
fi

echo "\033[0;34mSetting zsh as default shell...\033[0m"
chsh -s `which zsh`

if [ -d $DOTFILES ]; then
    echo "\033[0;34mFolder $DOTFILES already exists and it's being removed...\033[0m"
    rm -rf $DOTFILES
fi

echo "\033[0;34mCloning dotfiles...\033[0m"
git clone git://github.com/ondrowan/dotfiles.git $DOTFILES

echo "\033[0;34mSymlinking .zshrc...\033[0m"
ln $DOTFILES/.zshrc ~/.zshrc