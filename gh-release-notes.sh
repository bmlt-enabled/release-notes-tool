#!/bin/bash

# if travis isn't calling the script we abort
if [[ -z "$CI" ]]; then
    echo "Script is only to be run by Github Actions" 1>&2
    exit 1
fi

# if tag isn't set we abort
if [[ -z "$GITHUB_REF" ]]; then
    echo "Tag not set, changelog export." 1>&2
    exit 0
fi

TAG="${GITHUB_REF##*/}"

# if required params are not set we abort
if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "File or Delimiter not set, aborting changelog export." 1>&2
    exit 0
fi

if [[ "$2" == *"wp"* ]]; then
   CHANGE=$(sed -e '1,/= Changelog =/d' $1 | sed "/$TAG/,/=/!d;//d" | awk 'NF')
else
   CHANGE=$(sed "/$TAG/,/$2/!d;//d" $1 | awk 'NF')
fi

echo "$CHANGE" > changelog.txt
