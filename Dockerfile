FROM python:3.10-slim

RUN apt-get update

RUN apt-get install python3-dev build-essential -y

ENV PYTHONDONTWRITEBYTECCODE 1
ENV VIRTUAL_ENV=/opt/venv

RUN pip3 install --upgrade pip

RUN pip3 install virtualenv && python3 -m virtualenv $VIRTUAL_ENV

ENV PAth='$VIRTUAL_ENV/bin:$PAth'

ADD ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app
