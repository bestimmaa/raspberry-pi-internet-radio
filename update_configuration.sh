#!/bin/sh

echo "updating configuration..."

mydir="$(pwd)"

/etc/init.d/lcd4linuxservice.sh stop
/etc/init.d/chrisfmservice.sh stop

# create the run folder for services not running as root (might apply to the API server in future)
#mkdir -p /usr/local/var/run

# copy daemons

#cp $mydir/delayed_lcd4linux_startup.sh /usr/local/bin
#chmod +x /usr/local/bin/delayed_lcd4linux_startup.sh

cp $mydir/chrisfm.py /usr/local/bin/chrisfm/chrisfm.py
chmod 755 /usr/local/bin/chrisfm/chrisfm.py

cp $mydir/chrisfmserver.js /usr/local/bin/chrisfm/chrisfmserver.js

cp $mydir/chrisfmservice.sh /etc/init.d/chrisfmservice.sh
chmod 755 /etc/init.d/chrisfmservice.sh

# copy the script to run the API server as daemon (not yet implemented)

#cp $mydir/chrisfmserverservice.sh /etc/init.d/chrisfmserverservice.sh
#chmod 755 /etc/init.d/chrisfmserverservice.sh

cp $mydir/lcd4linuxservice.sh /etc/init.d/lcd4linuxservice.sh
chmod 755 /etc/init.d/lcd4linuxservice.sh

# remove daemons and setup to run at boot
update-rc.d -f chrisfmservice.sh remove
update-rc.d -f lcd4linuxservice.sh remove

invoke-rc.d chrisfmservice.sh stop 
invoke-rc.d lcd4linuxservice.sh stop 

# set the daemon to run at start up
update-rc.d chrisfmservice.sh defaults
update-rc.d lcd4linuxservice.sh defaults

# copy lcd4linux dpf configuration
cp $mydir/lcd4linux.conf /etc/lcd4linux.conf
chmod 600 /etc/lcd4linux.conf
chown root.root /etc/lcd4linux.conf

# restart chrisfm service and lcd4linux
/etc/init.d/lcd4linuxservice.sh start
/etc/init.d/chrisfmservice.sh start
