#!/usr/bin/env bash

source scripts/env.sh

echo "Creating admin user"
./manage.py createsuperuser --username $djadmin --email $djemail --noinput

echo "Setting admin user password"
scripts/setadminpw.py $djadmin $djpasswd