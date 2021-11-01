#!/bin/bash

if [ $# -eq 0 ] || [ $1 != "not" ] ; then
  echo 'precompiling assets'
  SECRET_KEY_BASE=`bin/rake secret` RAILS_ENV=production rake assets:precompile
else
  echo "argument is not, so not running precompile"
fi
