#!/bin/sh

echo "updating configuration"

mydir="$(pwd)"

#copy daemon

cp $mydir/chrisfm.py /usr/local/bin/chrisfm/chrisfm.py
chmod 755 /usr/local/bin/chrisfm/chrisfm.py

cp $mydir/chrisfmservice.sh /etc/init.d/chrisfmservice.sh
chmod 755 /etc/init.d/chrisfmservice.sh

#let daemon run at default times
update-rc.d chrisfmservice.sh defaults

#copy lcd4linux dpf configuration
cp $mydir/lcd4linux.conf /etc/lcd4linux.conf
chmod 600 /etc/lcd4linux.conf
chown root.root /etc/lcd4linux.conf


