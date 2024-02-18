#echo "start"
#service mariadb start
#
#mariadb "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'";
#
#echo "command"
#mariadb "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#
#mariadb "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#mariadb "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#mariadb "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#
#mariadb "FLUSH PRIVILEGES;"
#
#echo "ms admin"
#mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
#
#echo "exec"
#exec mysqld_safe

set -e


if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld
	chown mysql:mysql /run/mysqld
fi

#ls /var/lib/mysql
#if [ ! -d "/var/lib/mysql" ]; then
    #mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    cat << EOF | mysqld --user=mysql --basedir=/usr --datadir=/var/lib/mysql --bootstrap
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
#fi

mysqld --user=mysql --basedir=/usr --datadir=/var/lib/mysql --bind-address='*' --skip-networking=0



