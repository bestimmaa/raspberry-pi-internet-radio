#!/bin/sh

echo "updating configuration..."

#kill lcd4linux process
#killall lcd4linux

mydir="$(pwd)"

/etc/init.d/lcd4linuxservice.sh stop
/etc/init.d/chrisfmservice.sh stop

#copy daemon

cp $mydir/chrisfm.py /usr/local/bin/chrisfm/chrisfm.py
chmod 755 /usr/local/bin/chrisfm/chrisfm.py

cp $mydir/chrisfmservice.sh /etc/init.d/chrisfmservice.sh
chmod 755 /etc/init.d/chrisfmservice.sh

cp $mydir/lcd4linuxservice.sh /etc/init.d/lcd4linuxservice.sh
chmod 755 /etc/init.d/lcd4linuxservice.sh

# remove daemons and setup to run at boot
update-rc.d -f chrisfmservice.sh remove
update-rc.d -f lcd4linuxservice.sh remove

invoke-rc.d chrisfmservice.sh stop 
invoke-rc.d lcd4linuxservice.sh stop 

update-rc.d chrisfmservice.sh defaults
update-rc.d lcd4linuxservice.sh defaults

# copy lcd4linux dpf configuration
cp $mydir/lcd4linux.conf /etc/lcd4linux.conf
chmod 600 /etc/lcd4linux.conf
chown root.root /etc/lcd4linux.conf

# copy python module for driving ldc4linux
cp $mydir/slideshow.py /home/pi/python_modules/slideshow.py
chown root:root /home/pi/python_modules/slideshow.py
chmod 700 /home/pi/python_modules/slideshow.py 

# restart chrisfm service and lcd4linux
/etc/init.d/lcd4linuxservice.sh start
/etc/init.d/chrisfmservice.sh start
