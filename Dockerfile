FROM python:3.8.10-slim-buster

ENV DOCKERHOME=/home/app/web

RUN mkdir -p ${DOCKERHOME}

WORKDIR ${DOCKERHOME}

COPY . ${DOCKERHOME}

RUN pip install -r requirements.txt

CMD [ "sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8300" ]
