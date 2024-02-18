FROM debian:bookworm

RUN apt update -y && apt upgrade -y

RUN apt-get install mariadb-server -y
RUN apt-get install sudo -y

#COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/configure.sh	/tmp/configure.sh

ENTRYPOINT [ "sh", "/tmp/configure.sh"]
