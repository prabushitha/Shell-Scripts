#!/bin/bash

if [ $# -ne 2 ] || [ $1 = "-h" ]
then
    
    echo "backupme is to backup any file or directory easily to a destination.";
    echo "";
    echo "USAGE:";
    echo "-------------------------------------";
    echo "$0 source destination";
    echo "-------------------------------------";
    echo "";
    exit;
fi

#$1 source (dir or file)
#$2 destination

e=`date +%Y%m%d`; #get the date formatted
back=$2/$1"_"$e.bac;

#copy source to the destination
cp -R $1 $back #copy source to the backup directory
#check if the source is a directory. if a directory find all files and directories and rename them
if [ -d "$1" ]
then
    #find each file and rename
    for file in `find $back -type f`; do
        mv $file $file"_"$e.bac
    done

    #find each directory and rename
    for file in `find $back/* -type d`; do
        mv $file $file"_"$e.bac
    done  
fi

echo "Successfully backed up";
