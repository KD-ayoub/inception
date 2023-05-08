FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/ST=KH/L=1337"

COPY tools/index1.php /var/www/html
COPY tools/script.sh /

COPY config.conf /etc/nginx/sites-enabled/

RUN nginx -v
RUN nginx -t
RUN echo "hey"
RUN chmod +x ./script.sh
CMD ["./script.sh"]
# CMD ["nginx", "-g", "daemon off;"]