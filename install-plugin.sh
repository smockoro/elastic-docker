#!/bin/bash

cd `dirname $0`

install-plugin () {
  #already installed?
  elasticsearch-plugin list | grep $1
  
  if [ "$?" -eq 1 ]; then
    echo "install plugin... $1"
    module=`ls | grep $1`
    echo "y" |  elasticsearch-plugin install file:$module
  fi
}


install-plugin $1
