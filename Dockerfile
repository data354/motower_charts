FROM apache/airflow:2.5.3
LABEL maintainer="Data354"
LABEL airflow-version="2.5.3"
#Ce paramètre empêche le masquage des erreurs dans un pipeline
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root
RUN apt-get update -y && apt-get install libpq-dev -y && apt-get install python-dev -y && apt-get install gcc -y && python -m pip install --upgrade pip
USER airflow
COPY req.txt .
RUN pip install -r req.txt
RUN pip install psycopg2 && pip install openpyxl
USER root

