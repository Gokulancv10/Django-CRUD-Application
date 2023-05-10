FROM python:3.8.10-slim-buster

ENV DOCKERHOME=/home/app/web

RUN mkdir -p ${DOCKERHOME}

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y --no-install-recommends gcc && \
    apt-get install -y python3-dev && apt-get install -y default-libmysqlclient-dev && \
    pip install mysqlclient==2.0.1 && apt-get install -y build-essential && \
    pip install --upgrade pip && apt-get remove -y gcc && \
    apt-get remove -y default-libmysqlclient-dev && apt-get remove -y build-essential

WORKDIR ${DOCKERHOME}

COPY . ${DOCKERHOME}

RUN pip install -r requirements.txt

# CMD [ "sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:80" ]
