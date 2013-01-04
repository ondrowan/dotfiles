set -e

USER=`whoami`
CODE=~/Code
SITES=~/Sites
DOTFILES=~/.dotfiles

if [ ! -d $CODE ]; then
    echo "Creating $CODE directory..."
    mkdir $CODE
fi

if [ ! -d $SITES ]; then
    echo "Creating $SITES directory..."
    mkdir $SITES
fi

# stuff
sudo apt-get install git vim zsh pidgin ack curl mc python-setuptools apache2 mysql-server postgresql php5 php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mysqlnd php5-pgsql php5-sqlite php5-suhosin php5-xdebug

# pip & virtualenv

if command -v pip > /dev/null 2>&1; then
    echo "Installing pip..."
    sudo easy_install pip
fi

sudo pip install virtualenv virtualenvwrapper

# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "Folder .oh-my-zsh already exists and it's being removed..."
    rm -rf ~/.oh-my-zsh
fi

echo "Cloning oh-my-zsh..."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi

echo "Setting zsh as default shell..."
chsh -s `which zsh`

if [ -d $DOTFILES ]; then
    echo "Folder $DOTFILES already exists and it's being removed..."
    rm -rf $DOTFILES
fi

echo "Cloning dotfiles..."
git clone git://github.com/ondrowan/dotfiles.git $DOTFILES

echo "Symlinking .zshrc..."
ln $DOTFILES/.zshrc ~/.zshrc