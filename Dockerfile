FROM python:3.10-slim AS builder

RUN apt-get update && \
    apt-get install -y libpq-dev gcc

# Create the virtual environment
RUN python3 -m venv /opt/venv
# Activate the virtual environment
ENV PATH="opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Operational stage
FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/venv /opt/venv

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="opt/venv/bin:$PATH"

WORKDIR /code

COPY . /code/

CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]