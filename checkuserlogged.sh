#!/bin/bash

#This script will tell you how long the console user has been logged into a Machine and who they are.

# Define MYUSER
MYUSER=`who | grep console | awk '{print $1}'`

# Now that we have a user defined, check to see if the user is _root_ or _its_
if [ "$MYUSER" == 'root' ] || [ "$MYUSER" == 'its' ]; then
echo "User is admin"
else
LOGIN=`who | grep console | grep $MYUSER | awk '{print "at",$6,"on",$3,$4,$5}'`
echo "User $MYUSER has been logged into this machine $LOGIN and is currently still logged in"
exit 0
fi
exit 0
