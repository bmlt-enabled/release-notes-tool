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

if [[ "$2" == *"wp"* ]]; then
  CHANGE=$(sed -e '1,/= Changelog =/d' $1 | sed "/$TRAVIS_TAG/,/=/!d;//d" | awk 'NF')
else
   CHANGE=$(sed "/$TRAVIS_TAG/,/$2/!d;//d" $1 | awk 'NF')
fi

echo "$CHANGE" > changelog.txt
