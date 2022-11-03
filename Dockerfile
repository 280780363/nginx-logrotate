FROM ubuntu:20.04

RUN apt-get update && apt-get -y install  nginx=1.18.0-1~xenial dos2unix

COPY ./nginx /etc/logrotate.d/nginx
COPY ./logrotate.conf /etc/logrotate.conf
RUN chmod 644 /etc/logrotate.d/nginx
RUN chmod 644 /etc/logrotate.conf
RUN dos2unix /etc/logrotate.d/nginx

CMD service cron start && nginx -g 'daemon off;'