# Cotswold Digital Matatus

Survey data visualization

### Dashboard

![dashboard](https://user-images.githubusercontent.com/43814350/119695203-a0d96a00-be56-11eb-9dc4-8f66c8eef79e.png)

### Map

![map](https://user-images.githubusercontent.com/43814350/119695505-e6963280-be56-11eb-9a40-662e42cb1c15.png)

### Summaries

![home](https://user-images.githubusercontent.com/43814350/119696150-8eabfb80-be57-11eb-9e9d-1eb285c15583.png)

## Installation

### Frontend project files

Made using [React](https://reactjs.org/) and UI designed with [Material UI](https://material-ui.com/).

Use the package manager [npm](https://www.npmjs.com/) to install project dependencies.

```bash
cd frontend
npm install
```

#### Running development version

```bash
npm run start
```

#### Creating production build

```bash
npm run build
```

### Database

A [PostgreSQL](https://www.postgresql.org/) database installation will be required to load the survey data which requires a [PostGIS](https://postgis.net/) extension to support geographic objects for location queries.

If on windows, you may require to install the [OSGeo4W](https://trac.osgeo.org/osgeo4w/) extension to be able to use Django with PostGIS.

More information be found on [The Open Source Geospatial Foundation](https://www.osgeo.org/).

To load the data:

```bash
cd backend/db/

# (LINUX) Perform all actions as $POSTGRES_USER (Can replace with intended user)
export PGUSER="$POSTGRES_USER"

# Update the current (postgres) database with historical data
psql -f /opt/dump.sql postgres

```

An additional backup script is available for creating data dumps (backend/db/pgbackup.sh)

### Backend project files

Made with Django and Django rest framework

Requires [python 3.6+](https://www.python.org/)

Use the package manager [pipenv](https://pypi.org/project/pipenv/) to install project dependencies.

```bash
cd backend
pipenv shell # activate virtual environment
pipenv install # install project dependencies
```

#### Running development version

```bash
cd dmatat/

# Setup development environment
pipenv install --dev # install depenpencies
python manage.py makemigrations # generate commands to update database schema with latest ORM
python manage.py migrate # execute commands to update database

# Start development server
python manage.py runserver
```

#### Creating production build

See Docker deployment below

## Deploying project to production (Linux Environment)

Production build managed with Docker containerization
Requires [Docker](https://docs.docker.com/).

The backend will be served using [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/) and the frontend will be served using [NGINX](http://nginx.org/en/docs/).

For the production build to work, the following environment variables should be set appropriately in the docker yaml file:

```yaml
- POSTGRES_PASSWORD

- POSTGRES_PASS

- POSTGRE_DEV_PASS

- ENV=Production

- DJANGO_PROD=True

- DJANGO_SECRET
```

Navigate to project root directory and run command:

```bash
docker-compose up --build -d # Fetch and create necessary images and run containers
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

Pending
