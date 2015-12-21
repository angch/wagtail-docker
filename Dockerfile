FROM ubuntu:14.04

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
  apt-get install -y language-pack-en-base python python-pip libjpeg-dev zlib1g-dev libpython-dev &&\
  apt-get clean &&\
  locale-gen en_US &&\
  update-locale LANG=en_US.UTF-8

RUN pip install wagtail

RUN mkdir -p /data/wagtail && cd /data/wagtail && wagtail start mysite

WORKDIR /data/wagtail/mysite

RUN pip install -r requirements.txt && python manage.py migrate && python manage.py createsuperuser

# Above createsuperuser *will* fail because no tty. We'll leave it for now.

EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000
