#!/usr/bin/bash

DECISION=$(( $RANDOM % 2 ))

if [[ $DECISION -eq 1 ]]; then
  echo "You should do it!"
  notify-send "Yo, just do it, you only have one life." "This should be fun."
else
  echo "Nah, don't do it."
  notify-send "Hello?" "Are you thinking straight?\nDon't even think about it."
fi
