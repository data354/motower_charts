FROM apache/airflow:latest
LABEL maintainer="Data354"
LABEL airflow-version="2.7.0"
#Ce paramètre empêche le masquage des erreurs dans un pipeline
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root
RUN apt-get update -y && apt-get install libpq-dev -y && apt-get install python-dev -y && apt-get install gcc -y
USER airflow
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install psycopg2 && pip install openpyxl
USER root

