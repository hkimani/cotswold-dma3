# unprivileged container: A container that allows you to run NGINX in unprivileged mode
FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uswgi_params

# USER root

# RUN mkdir -p /opt/dma3/static
# RUN chmod 755 /opt/dma3/static

# USER nginx