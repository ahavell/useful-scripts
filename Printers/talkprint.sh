#!/bin/bash

#This script will tell you how much ink is in the canon pixma (and others probably - I dont care) default printer on macOS
#Run this as a launch agent so we always know the ink levels in a way that will never get annoying whatsoever. 

# Define MYUSER
MYUSER=`who | grep console | awk '{print $1}'`

#get the ink marker levels as a comma separated string

LEVELS=`lpoptions | tr ' ' '\n' | grep marker-levels | sed 's/.*[=:]//'`

#blanks the file if present or creates a hidden file if not 
> .voice.txt

#build a txt file with a personal message about ink levels by appending each section before speaking this message to the user

echo "Hello $MYUSER. Your current ink levels are as follows: " >> .voice.txt

echo $LEVELS | awk -F ',' '{print "Magenta"" " $1 "%" ","}' >> .voice.txt
echo $LEVELS | awk -F ',' '{print "Black"" " $2 "%" ","}' >> .voice.txt
echo $LEVELS | awk -F ',' '{print "Yellow"" " $3 "%" ","}' >> .voice.txt
echo $LEVELS | awk -F ',' '{print "BlackPGBK"" " $4 "%" ","}' >> .voice.txt
echo $LEVELS | awk -F ',' '{print "Cyan"" " $5 "%" }' >> .voice.txt

#changed voice rate to 150 (default is 200) for clarity

say -f .voice.txt -r 150

#blanks the file 
> .voice.txt
