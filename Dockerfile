FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y libpq-dev gcc

RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]