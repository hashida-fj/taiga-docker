FROM python:3.6-alpine

RUN wget -O - https://github.com/taigaio/taiga-back/archive/3.3.13.tar.gz \
  | tar xzvf - \
 && mv taiga-back-3.3.13 taiga-back

WORKDIR /taiga-back

RUN apk add --no-cache libxml2 libxslt postgresql-libs gettext libjpeg \
 && apk add --no-cache --virtual .dep \
     git \
     gcc \
     musl-dev \
     postgresql-dev \
     libffi-dev \
     zlib-dev \
     zeromq-dev \
     gdbm-dev \
     ncurses-dev \
     jpeg-dev \
     libxml2-dev \
     libxslt-dev \
 && pip install -r requirements.txt \
 && apk del .dep

# Add and setup entrypoint
COPY entrypoint.sh /

#Healthcheck to make sure container is ready
HEALTHCHECK CMD curl --fail http://localhost:8001 || exit 1

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8001
VOLUME ["/taiga-back/static", "/taiga-back/media"]

# Declare volumes for mount point directories
