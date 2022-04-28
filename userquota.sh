#!/bin/sh

user=$(stat -f "%Su" /dev/console)

quota -u $user 
