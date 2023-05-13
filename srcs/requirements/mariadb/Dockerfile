FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server mariadb-client -y 

COPY /tools/script.sh /

RUN chmod +x ./script.sh

CMD ["./script.sh"]