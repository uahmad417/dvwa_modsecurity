#! /bin/bash
sed -i "s/[ [\']db_server[\'] ]   = [\']127.0.0.1[\']/\'db_server\' ]   = \'$DB_SERVER\'/g" config/config.inc.php
sed -i "s/[ [\']db_database[\'] ] = [\']dvwa[\']/\'db_database\' ] = \'$DB_DATABASE\'/g" config/config.inc.php
sed -i "s/[ [\']db_user[\'] ]     = [\']dvwa[\']/\'db_user\' ]     = \'$DB_USER\'/g" config/config.inc.php
sed -i "s/[ [\']db_password[\'] ] = [\']p@ssw0rd[\']/\'db_password\' ] = \'$DB_PASSWORD\'/g" config/config.inc.php
sed -i "s/[ [\']db_port[\']] = [\']3306[\']/\'db_port\'] = \'$DB_PORT\'/g" config/config.inc.php
sed -i "s/[ [\']default_security_level[\'] ] = [\']impossible[\']/\'default_security_level\' ] = \'$DVWA_SEC_LEVEL\'/g" config/config.inc.php
service apache2 start
tail -f /var/log/apache2/error.log
