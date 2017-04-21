#!/usr/bin/env bash
if [ -n "$BASH_VERSION" ]; then
    source env/bin/activate
	cd /var/www/html/evoca/evoca_v2/
	fish
fi
