FROM nginx:mainline-alpine

RUN apk add git
RUN git clone https://github.com/taigaio/taiga-front-dist.git taiga-front-dist

# Remove default configuration and add our custom Nginx configuration files
RUN rm /etc/nginx/conf.d/default.conf \
    && apk add --no-cache curl

COPY ["./taiga.conf", "/etc/nginx/conf.d"]
# COPY ./security.conf /etc/nginx/conf.d/


# Add and setup entrypoint
COPY entrypoint.sh /

#Healthcheck to make sure container is ready
# HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/var/run", "/etc/nginx/conf.d/", "/var/cache/nginx/"]

