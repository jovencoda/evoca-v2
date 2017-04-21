#!/usr/bin/env bash

# provisioning script that may be run several times
# if LC_ALL is none, then set it, and also update /etc/environment

LOCALE_FIX='LC_ALL=en_US.UTF-8'

export $LOCALE_FIX
echo $LOCALE_FIX >> /etc/environment


apt-get update
apt-get upgrade -y
apt-get install -y fish
fish

# apt-get install language-pack-UTF-8
apt-get install -y emacs
apt-get install -y python-virtualenv
apt-get install -y python-dev
apt-get install -y libpython-all-dev
apt-get install -y libmysqlclient-dev
apt-get install -y libjpeg-dev
apt-get install -y libtiff5-dev
apt-get install -y libjpeg8-dev
apt-get install -y zlib1g-dev
apt-get install -y libfreetype6-dev
apt-get install -y liblcms2-dev
apt-get install -y libwebp-dev
apt-get install -y tcl8.6-dev
apt-get install -y tk8.6-dev
apt-get install -y python-tk

# Create and activate virtual enviroment
virtualenv /home/vagrant/env
chown -R vagrant:vagrant /home/vagrant/env
source /home/vagrant/env/bin/activate

pip install -r /var/www/html/evoca/evoca_v2/requirements.txt

# Permissions
chown -R vagrant:vagrant /var/www/html/

