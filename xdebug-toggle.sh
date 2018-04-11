#!/bin/bash

README="Usage: php_debug <version> <on|off>"

if [ -z "$1" ]; then
  echo $README
  exit
fi

PHPDIR="/usr/local/etc/php/$1/conf.d";

case $2 in
  on)
    [ -f "$PHPDIR/ext-xdebug.ini.deactivated" ] && sudo mv "$PHPDIR/ext-xdebug.ini.deactivated" "$PHPDIR/ext-xdebug.ini"
  ;;
  off)
    [ -f "$PHPDIR/ext-xdebug.ini" ] && sudo mv "$PHPDIR/ext-xdebug.ini" "$PHPDIR/ext-xdebug.ini.deactivated"
  ;;
  *)
    echo $README
  ;;
esac
