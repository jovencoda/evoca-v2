#!/usr/bin/env bash
if [ -n "$BASH_VERSION" ]; then
  source env/bin/activate
  # Run requirements
  #pip install -r /var/www/html/evoca/evoca_v2/requirements.txt
  #cd /var/www/html/evoca/web-client
  #sudo npm install
  # Back to main folder
  cd /var/www/html/evoca
  fish
fi
