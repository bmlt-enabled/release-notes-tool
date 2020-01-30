#!/bin/bash

# TRAVIS_TAG=3.6.1

# if travis isn't calling the script we abort
if [[ -z "$TRAVIS" ]]; then
    echo "Script is only to be run by Travis CI" 1>&2
    exit 1
fi

# if tag isn't set we abort
if [[ -z "$TRAVIS_TAG" ]]; then
    echo "Tag not set, changelog export." 1>&2
    exit 0
fi

# if required params are not set we abort
if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "File or Delimiter not set, aborting changelog export." 1>&2
    exit 0
fi

CHANGE=$(sed "/$TRAVIS_TAG/,/$2/!d;//d" $1 | awk 'NF')

if [[ ${CHANGE} == *"License URI"* ]]; then
  # Since it could be a wordpress readme, latest version will be at top.
  # this could be better but it works.  # awk 'f{print;f=0} /License URI/{f=1}'
  echo "$CHANGE" | sed 1,2d  > changelog.txt
else
   echo "$CHANGE" > changelog.txt
fi
