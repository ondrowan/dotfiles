set -e

USER=`whoami`
CODE=~/Code
SITES=~/Sites
DOTFILES=~/.dotfiles

if [ ! -d $CODE ]; then
    echo "\033[0;33mCreating $CODE directory...\e[00m"
    mkdir $CODE
fi

if [ ! -d $SITES ]; then
    echo "\033[0;33mCreating $SITES directory...\e[00m"
    mkdir $SITES
fi

# stuff
sudo apt-get install git vim zsh pidgin ack curl mc python-setuptools apache2 mysql-server postgresql php5 php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mysqlnd php5-pgsql php5-sqlite php5-suhosin php5-xdebug

# pip & virtualenv

if command -v pip > /dev/null 2>&1; then
    echo "\033[0;33mInstalling pip...\e[00m"
    sudo easy_install pip
fi

sudo pip install virtualenv virtualenvwrapper

# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "\033[0;33mFolder .oh-my-zsh already exists and it's being removed...\e[00m"
    rm -rf ~/.oh-my-zsh
fi

echo "\033[0;33mCloning oh-my-zsh...\e[00m"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv -b ~/.zshrc ~/.zshrc.bak
fi

echo "\033[0;33mSetting zsh as default shell...\e[00m"
chsh -s `which zsh`

if [ -d $DOTFILES ]; then
    echo "\033[0;33mFolder $DOTFILES already exists and it's being removed...\e[00m"
    rm -rf $DOTFILES
fi

echo "\033[0;33mCloning dotfiles...\e[00m"
git clone git://github.com/ondrowan/dotfiles.git $DOTFILES

echo "\033[0;33mSymlinking .zshrc...\e[00m"
ln $DOTFILES/.zshrc ~/.zshrc