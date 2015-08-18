#!/bin/bash

#
# Initialise an empty debian structure in direcories
#

TO_DEBIANIZE_DIR=$1

echo $TO_DEBIANIZE_DIR

[ -d "$TO_DEBIANIZE_DIR" ] && echo "directory already exist $TO_DEBIANIZE_DIR" && exit 1

ROOT_DIR=`pwd`
  for d in `find -maxdepth 1 -type d -name "*$TO_DEBIANIZE_DIR*"`; do
        echo -e "processing \e[34m$ROOT_DIR=/$d\e[39m";
    cd $ROOT_DIR/$d
      [ ! -d ./debian ]  && mkdir debian
      [ ! -d ./debian/source ] && mkdir debian/source
      [ ! -e ./debian/source/format ] && touch debian/source/format
      [ ! -e ./debian/compat ] && touch debian/compat
      [ ! -e ./debian/control ] && touch debian/control
      [ ! -e ./debian/install ] && touch debian/install
      [ ! -e ./debian/links ] && touch debian/links
      [ ! -e ./debian/rules ] && touch debian/rules
 done
 cd $ROOT_DIR


