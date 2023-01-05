#!/bin/bash
if [ -z "$1" ]
then
  echo "\$1 is empty"
  FILENAME=$(eval $"date +%d")
  TIMESTAMP=$(eval $"LC_TIME='ru_RU.UTF-8' date +%d.%m.%Y\ \(%A\)")
else
  echo "\$1 = $1"
fi

if test -f "$FILENAME"; then
    echo "$FILENAME already exists. Let's do nothing!"
else
  echo "$TIMESTAMP">"$FILENAME"

  echo "\$FILENAME=$FILENAME"
  echo "$TIMESTAMP"

fi

