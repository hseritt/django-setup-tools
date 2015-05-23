#!/usr/bin/env bash

if [ ! -e "manage.py" ]
then
	echo
	echo "Missing manage.py. This does not appear to be in a Django project. Please check."
	echo
	exit 1
fi

source scripts/env.sh
source scripts/lib.sh

check_env

clear; reset

echo "Recreating database ${dbname}"

case $dbtype in
	postgresql)
		sudo -iu postgres dropdb $dbname
		sudo -iu postgres createdb -O $dbuser $dbname
		;;
	mysql)
		mysql -u $dbsvruser -p${dbsvrpass} -e "drop database $dbname"
		mysql -u $dbsvruser -p${dbsvrpass} -e "create database $dbname"
		mysql -u $dbsvruser -p${dbsvrpass} -e "grant all privileges on ${dbname}.* to '${dbuser}'@'${dbsvrhost}' identified by '${dbpasswd}'"
		;;
	sqlite3)
		rm -rf $dbname
		;;
	*)
		echo "Database type ${dbtype} is not supported."
		;;
esac

echo "Makemigrations"
for app in ${apps[@]}
do
	echo "Clearing migrations"
	rm -rf $appsdir/$app/migrations/*
	./manage.py makemigrations $app
done

echo "Migrate"

./manage.py migrate

scripts/createsuperuser.sh

echo "Running server"
./manage.py runserver