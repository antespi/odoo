#!/bin/bash

root_path() {
   SOURCE="${BASH_SOURCE[0]}"
   DIR="$( dirname "$SOURCE" )"
   while [ -h "$SOURCE" ]
   do
     SOURCE="$( readlink "$SOURCE" )"
     [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
   done
   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

   echo "$DIR"
}

ROOT_PATH=`root_path`

echo "Cleaning *.pyc in '$ROOT_PATH' and subfolders"
/usr/bin/find "$ROOT_PATH" -name "*.pyc" -delete
