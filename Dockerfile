FROM nginx:1.18

RUN apt-get update && apt-get -y install cron logrotate dos2unix anacron

COPY ./nginx /etc/logrotate.d/nginx
RUN chmod 644 /etc/logrotate.d/nginx
RUN dos2unix /etc/logrotate.d/nginx

CMD service cron start && nginx -g 'daemon off;'