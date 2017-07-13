#!/usr/bin/env bash

# provisioning script that may be run several times
# if LC_ALL is none, then set it, and also update /etc/environment

LOCALE_FIX='LC_ALL=en_US.UTF-8'

export $LOCALE_FIX
echo $LOCALE_FIX >> /etc/environment

echo "### Updating ###"

apt-get update
apt-get upgrade -y

echo "### Installing base ###"

apt-get install -y fish
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
apt-get install libpq-dev

# Install postGIS
echo "### Installing postGIS ###"
apt-get install -y postgis postgresql-9.3-postgis-2.1
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology; CREATE EXTENSION fuzzystrmatch; CREATE EXTENSION postgis_tiger_geocoder" scotchbox

# Install proj.4
apt-get install libproj-dev proj-data proj-bin

# Create and activate virtual enviroment
virtualenv /home/vagrant/env
chown -R vagrant:vagrant /home/vagrant/env
source /home/vagrant/env/bin/activate

echo "### Installing requirements.txt ###"
pip install -r /var/www/html/evoca/evoca_v2/requirements.txt

# Permissions
chown -R vagrant:vagrant /var/www/html/

echo "### Making migrations ###"
source /home/vagrant/env/bin/activate
cd /var/www/html/evoca/evoca_v2/
python manage.py makemigrations
python manage.py migrate

# Create super user
echo "### Creating superuser ###"
cd /var/www/html/evoca/evoca_v2/
python manage.py shell < /var/www/html/evoca/provisioning/createsuperuser.py

echo "### Patch profile ###"
# patch .profile for the specified user
PROFILE_PATCH='source /var/www/html/evoca/provisioning/user_profile.sh'
echo $PROFILE_PATCH >> /home/vagrant/.profile

# install react cli for web-client
cd /var/www/html/evoca/web-client
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
