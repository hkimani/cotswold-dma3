FROM postgres:11

ENV POSTGISV 2.5

# add addressing dictionary
RUN mkdir -p /opt/apps

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-$PG_MAJOR-postgis-$POSTGISV \
    postgresql-$PG_MAJOR-postgis-$POSTGISV-scripts \
    postgresql-$PG_MAJOR-pgrouting \
    postgresql-$PG_MAJOR-pgrouting-scripts \
    postgresql-server-dev-$PG_MAJOR \
    unzip \
    make

# add bakcup job
RUN mkdir -p /opt/backups
COPY ./dump.sql /opt/dump.sql

COPY ./pgbackup.sh /opt/pgbackup.sh
RUN chmod +x /opt/pgbackup.sh

# add init script
RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh


# create volume for backups
# VOLUME ["/opt/backups"]


