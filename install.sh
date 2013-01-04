set -e

USER=`whoami`
CODE=$HOME/Code
SITES=$HOME/Sites

if [ ! -d $CODE ]; then
    mkdir $CODE
fi

if [ ! -d $SITES ]; then
    mkdir $SITES
fi

# pip & virtualenv
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper

# stuff
sudo apt-get install git zsh ack curl mc apache2 mysql-server postgresql php5 php5-cli php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mysqlnd php5-pgsql php5-sqlite php5-suhosin php5-xdebug

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s `which zsh`
