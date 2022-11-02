FROM nginx:1.18

RUN apt-get update && apt-get -y install logrotate dos2unix

COPY ./nginx /etc/logrotate.d/nginx
RUN chmod 644 /etc/logrotate.d/nginx
RUN dos2unix /etc/logrotate.d/nginx

CMD service cron start && nginx -g 'daemon off;'