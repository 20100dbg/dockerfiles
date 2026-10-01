#!/bin/sh
echo Listening on http://localhost:$WEB_PORT
echo MySQL credentials: root / $MYSQL_ROOT_PASSWORD

apache2ctl -DFOREGROUND
