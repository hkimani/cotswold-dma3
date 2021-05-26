#!/bin/bash

NAME="dma3"                                                           # Name of the application
DJANGODIR=/home/dmatat/visualization/dma3/backend/dmatat              # Django project directory
SOCKFILE=/home/dmatat/visualization/dma3/backend/dmatat/gunicorn.sock # Created at runtime. we will communicte using this unix socket
USER=dmatat                                                           # the user to run as
GROUP=dmatat                                                          # the group to run as
NUM_WORKERS=3                                                         # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=dmatat.settings                                # which settings file should Django use
DJANGO_WSGI_MODULE=dmatat.wsgi.py                                     # WSGI module name
echo "Starting $NAME as $(whoami)"

# Activate the virtual environment

cd $DJANGODIR
source /home/dmatat/visualization/dma3/backend/dmatat/env/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist

RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=- \
  --limit-request-line 8190 \
  -b 0.0.0.0:9000
