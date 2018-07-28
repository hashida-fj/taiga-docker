#!/bin/sh

echo "aaaaa"

# settings
python manage.py migrate --noinput
python manage.py loaddata initial_user
python manage.py loaddata initial_project_templates
python manage.py compilemessages
python manage.py collectstatic --noinput

# Run taiga-back
gunicorn -w 3 -t 60 --pythonpath=. -b 0.0.0.0:8001 taiga.wsgi
# python manage.py runserver
