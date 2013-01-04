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

# stuff
sudo apt-get install git vim zsh pidgin ack curl mc python-setuptools apache2 mysql-server postgresql php5 php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mysqlnd php5-pgsql php5-sqlite php5-suhosin php5-xdebug

# pip & virtualenv
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s `which zsh`
