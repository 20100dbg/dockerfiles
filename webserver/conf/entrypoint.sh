#!/bin/sh
echo Listening on http://localhost:$WEB_PORT
echo root / $MYSQL_ROOT_PASSWORD

apache2ctl -DFOREGROUND