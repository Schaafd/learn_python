#!/usr/bin/env bash

NAME="hello"
FLASKDIR=~/PycharmProjects/learn_python/FLASK
SOCKFILE=~/PycharmProjects/learn_python/FLASK/sock
USER=root
GROUP=root
NUM_WORKERS=3

echo "Starting $NAME"

#Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

#Start your gunicorn
exec gunicorn hello:app -b 0.0.0.0:8080 \
    --name $NAME \
    --workers $NUM_WORKERS \
    --user=$USER --group=$GROUP \
    --bind=unix:$SOCKFILE