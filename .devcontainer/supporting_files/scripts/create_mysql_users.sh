#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &
echo ">> env variables"
printenv
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

_word=$( [ "${MYSQL_PASSWORD}" ] && echo "preset" || echo "random" )
echo "=> Creating MySQL admin user with ${_word} password"

mysql -uroot -e "CREATE USER 'pma'@'%' IDENTIFIED BY '${_word}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'pma'@'%' WITH GRANT OPTION"
# mysql -uroot -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' WITH GRANT OPTION;"

CREATE_MYSQL_USER=false

if [ -n "$MYSQL_USER_NAME" ] || \
   [ -n "$MYSQL_DATABASE" ] || \
   [ -n "$MYSQL_PASSWORD" ]; then
      CREATE_MYSQL_USER=true
fi

if [ "$CREATE_MYSQL_USER" = true ]; then
    _user=${MYSQL_USER_NAME:-user}
    _userdb=${MYSQL_DATABASE:-db}
    _userpass=${MYSQL_PASSWORD:-password}

    mysql -uroot -e "CREATE USER '${_user}'@'%' IDENTIFIED WITH mysql_native_password BY '${_userpass}'"
    mysql -uroot -e "GRANT USAGE ON *.* TO '${_user}'@'%';"
    mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${_userdb}"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON ${_userdb}.* TO '${_user}'@'%' WITH GRANT OPTION;"
fi

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MySQL Server with $PASS"
echo ""
echo "    mysql -uadmin -p$PASS -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MySQL user 'root' has no password but only allows local connections"
echo ""

if [ "$CREATE_MYSQL_USER" = true ]; then
    echo "We also created"
    echo "A database called '${_userdb}' and"
    echo "a user called '${_user}' with password '${_userpass}'"
    echo "'${_user}' has full access on '${_userdb}'"
fi

echo "enjoy!"
echo "========================================================================"

mysqladmin -uroot shutdown