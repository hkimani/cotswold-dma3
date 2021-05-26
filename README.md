# Cotswold Digital Matatus

Survey data visualization

## Installation

### Frontend project files

Made using create-react app.

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

A [PostgreSQL](https://www.postgresql.org/) database installation will be required to load the survey data which requires a [PostGIS](https://postgis.net/) extension to to load the data correctly.

To load the data:

```bash
cd backend/db/

# (LINUX) Perform all actions as $POSTGRES_USER (Can replace with intended user)
export PGUSER="$POSTGRES_USER"

# Update the current (postgres) database with historical data
psql -f /opt/dump.sql postgres

```

An additional backup script is available for creating data dumps

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

#### - POSTGRES_PASSWORD

#### - POSTGRES_PASS

#### - POSTGRE_DEV_PASS

#### - ENV=Production

#### - DJANGO_PROD=True

#### - DJANGO_SECRET

Navigate to project root directory and run command:

```bash
docker-compose up --build -d # Fetch and create necessary images and run containers
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

Pending
