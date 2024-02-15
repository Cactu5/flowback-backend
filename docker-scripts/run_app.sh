#!/bin/sh

echo "Starting flowback backend"
echo "Waiting for postgres"

# wait for PSQL server to start
sleep 10

echo "Setting up flowback backend"

echo "Run makemigrations"
python3 manage.py makemigrations
echo "Run migrate"
python3 manage.py migrate
echo "Start server"
python3 manage.py runserver 0.0.0.0:8000