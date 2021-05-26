#!/bin/bash

# Stop execution of code when there is an error
# set -e

# Path
cd /opt/dma3/dmatat

export DJANGO_SETTINGS_MODULE=dmatat.settings

# TODO: // Wait for one minute for the sql server to start
# TODO: // IMPLEMENT

# --run-syncdb¶
# Allows creating tables for apps without migrations. While this isn’t recommended, the migrations framework is sometimes too slow on large projects with hundreds of models.

# --noinput, --no-input¶
# Suppresses all user prompts. An example prompt is asking about removing stale content types.
# python manage.py makemigrations --noinput
python manage.py migrate --noinput --run-syncdb

echo "Collect all static files for the project to the root static folder... I will not post the progress"
python manage.py collectstatic --noinput --verbosity 0
echo "Finished collecting the static files"

# echo "Creating the default superuser ..."
# python -m django_createsuperuser "admin" "${MYSQL_ROOT_PASSWORD}" "${USER_EMAIL}"
# echo "Superuser created ..."

# Server start
echo "Starting server ..."
# python manage.py runserver 0.0.0.0:9000
# uwsgi --socket :9000 --master --enable-threads --module dmatat.wsgi --logto /var/log/uwsgi/all.log
uwsgi --socket :9000 --master --enable-threads --module dmatat.wsgi
