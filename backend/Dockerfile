FROM python:3
ENV PYTHONUNBUFFERED 1

# update the system and install requisite components
RUN apt-get update -y &&  \
    apt-get install -y \
    python-psycopg2 \
    libpq-dev \
    python3-dev \
    binutils \
    libproj-dev \
    gdal-bin \
    libgeos++ \
    proj-bin 

# Create our base folder
RUN mkdir /opt/dma3

# create the folder where the static files will be collected to
RUN mkdir /opt/dma3/static

# Return to the base folder
WORKDIR /opt/dma3

COPY dmatat/requirements.txt /opt/dma3/
RUN pip install -r requirements.txt

# Required for textblob to work
RUN python -m textblob.download_corpora

# Create log file
RUN mkdir -p /var/log/uwsgi/
RUN touch /var/log/uwsgi/all.log

COPY . /opt/dma3/

# create non root user to heighten security
# RUN adduser -D user
# RUN chown -R user:user /opt
# RUN chmod -R 755 /opt

# Switch to new user
# USER user