#!/bin/bash
source /app/.venv/bin/activate
cd /app/www
gunicorn --worker-class gevent -w 1 app:app --bind 0.0.0.0:5000