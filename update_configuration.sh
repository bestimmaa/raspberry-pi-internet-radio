#!/bin/sh

echo "updating configuration..."

mydir="$(pwd)"

# stop all daemons

/etc/init.d/lcd4linuxservice.sh stop
/etc/init.d/chrisfmservice.sh stop

# install python module

cd $mydir/lcdmanager
python setup.py install
cd ..

# copy daemons

cp $mydir/chrisfm.py /usr/local/bin/chrisfm/chrisfm.py
chmod 755 /usr/local/bin/chrisfm/chrisfm.py

cp $mydir/chrisfmserver.js /usr/local/bin/chrisfm/chrisfmserver.js

cp $mydir/chrisfmservice.sh /etc/init.d/chrisfmservice.sh
chmod 755 /etc/init.d/chrisfmservice.sh

cp $mydir/lcd4linuxservice.sh /etc/init.d/lcd4linuxservice.sh
chmod 755 /etc/init.d/lcd4linuxservice.sh

# remove daemons and setup to run at boot
update-rc.d -f chrisfmservice.sh remove
update-rc.d -f lcd4linuxservice.sh remove

#invoke-rc.d chrisfmservice.sh stop 
#invoke-rc.d lcd4linuxservice.sh stop 

update-rc.d chrisfmservice.sh defaults
update-rc.d lcd4linuxservice.sh defaults

# copy lcd4linux dpf configuration
cp $mydir/lcd4linux.conf /etc/lcd4linux.conf
chmod 600 /etc/lcd4linux.conf
chown root.root /etc/lcd4linux.conf

# restart chrisfm service and lcd4linux
/etc/init.d/lcd4linuxservice.sh start
/etc/init.d/chrisfmservice.sh start
