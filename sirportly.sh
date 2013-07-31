#!/bin/sh

curl --silent $RSS_URL | \
  grep -E 'title>' | \
  sed -n '2,$p' | \
  sed -e 's/ *<title>//' -e 's/<\/title>//'