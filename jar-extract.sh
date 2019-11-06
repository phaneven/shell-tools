#!/bin/bash

if [ -e $1 ]
then
    jar_package=$1
    echo $jar_package
    dir=${jar_package/.jar//}
    echo `unzip -x -q $jar_package -d $dir`
    echo "$dir have generated completely"
    eval `cp $jar_package $dir`
else
    echo "please input the jar package path"
fi
