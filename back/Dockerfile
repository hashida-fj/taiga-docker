FROM python:3.6-alpine

RUN apk add git
RUN git clone https://github.com/taigaio/taiga-back.git taiga-back
WORKDIR /taiga-back

RUN apk add \
py3-lxml \
postgresql-libs \
gettext \
gcc musl-dev postgresql-dev libffi-dev zlib-dev zeromq-dev gdbm-dev ncurses-dev jpeg-dev libxml2-dev libxslt-dev

RUN pip install -r requirements.txt

