FROM debian:bullseye


RUN apt update -y && apt upgrade -y

RUN apt-get install mariadb-server -y

COPY tools/configure.sh	/tmp/configure.sh


ENTRYPOINT [ "sh", "/tmp/configure.sh"]
