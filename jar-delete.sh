#!/bin/bash

path_prefix=$1
jar_package=$2
match_pattern=$3

function scan() {
    for file in `ls $1`
    do
        local path=$1"/"$file
        if [ -d $path ]
        then
            scan $path
        else
            if [[ $file =~ $match_pattern ]]
            then
                echo "@file $path"
                echo `zip -d $jar_package $path`
            fi
        fi
    done
}

if [ -e $path_prefix ]
then
    echo "start replacing file"
    scan $path_prefix
else
    echo "$path_prefix is not existed"
fi