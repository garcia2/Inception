set -e

if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld
	chown mysql:mysql /run/mysqld
fi

    cat << EOF | mysqld --user=mysql --basedir=/usr --datadir=/var/lib/mysql --bootstrap
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --basedir=/usr --datadir=/var/lib/mysql --bind-address='*' --skip-networking=0
