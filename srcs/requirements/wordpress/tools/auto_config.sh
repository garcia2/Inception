set -e

sleep 5

if [ ! -f ./wp-config.php ]
then
    wp core download --allow-root --force
    
    echo "connexion"
    wp config create    --dbname="$SQL_DATABASE" \
                        --dbuser="$SQL_USER" \
                        --dbpass="$SQL_PASSWORD" \
                        --dbhost=mariadb:3306 \
                        --allow-root \
                        --force
    echo "core install"
    wp core install --url=$WP_URL \
                    --title="$WP_TITLE" \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_ADMIN_PASS \
                    --admin_email=$WP_ADMIN_MAIL \
                    --allow-root
    
    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS --allow-root
    
    wp config shuffle-salts --allow-root
    
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.4 -F -R
else
    echo "Wordpress's installation failed"
fi