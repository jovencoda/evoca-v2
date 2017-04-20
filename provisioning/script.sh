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

# install postGres db
apt-get install -y libpq-dev
apt-get install -y postgresql
apt-get install -y postgresql-contrib
# installation
sudo su - postgres
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'evocaDB'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE evocaDB"
psql -c "CREATE USER root WITH PASSWORD 'root';"
psql -c "ALTER ROLE root SET client_encoding TO 'utf8';"
psql -c "ALTER ROLE root SET default_transaction_isolation TO 'read committed';"
psql -c "ALTER ROLE root SET timezone TO 'UTC';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE evocaDB TO root;"
pip install psycopg2

# Permissions
chown -R vagrant:vagrant /var/www/html/

