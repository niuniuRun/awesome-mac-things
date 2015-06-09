#!/bin/bash

if [ ! -z $1 ]; then
    DIR=$2
    if [ -z $DIR ]; then
        OLD_IFS=”$IFS”
        IFS=”/”
        arr=($1)
        IFS=”$OLD_IFS”
        len=${#arr[@]}
        DIR=${arr[($len-1)]}
    fi

    git clone $1 $DIR

    echo 'git cloned to '$DIR

    cd $DIR
fi
rm -rf .gitignore

IGNORE_FILES=(.DS_Store build target .idea .classpath .project *.iml out)

for rm_file in ${IGNORE_FILES[@]}
do
  echo $rm_file >> .gitignore 
done
