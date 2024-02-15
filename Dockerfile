FROM python:3.10

ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

RUN echo "postgres:5432:flowback:flowbackuser:password123" > .flowback.pgpass
RUN chmod 0600 .flowback.pgpass

ADD /docker-scripts/pg_service.conf /etc/postgresql-common/pg_service.conf
ADD /docker-scripts/run_app.sh /app/run_app.sh
RUN chmod +x /app/run_app.sh
CMD ["/app/run_app.sh"]