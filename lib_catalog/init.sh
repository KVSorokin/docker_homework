#!/bin/bash
set -e

python manage.py migrate --noinput
python parse_docx.py
python manage.py loaddata catalog/fixtures/bbk_data.json

python manage.py runserver 0.0.0.0:8000
