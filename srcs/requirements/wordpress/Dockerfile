FROM debian:buster

RUN apt-get update && apt-get install php php-fpm php-mysql curl -y

COPY tools/script.sh /

RUN chmod 777 /script.sh

CMD ["./script.sh"]