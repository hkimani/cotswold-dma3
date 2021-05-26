#!/bin/sh

# This tells bash that it should exit the script if any statement returns a non-true return value.
set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

psql -f /opt/dump.sql postgres
