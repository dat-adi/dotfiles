#!/bin/bash

POWER_SUPPLY_CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $POWER_SUPPLY_CAPACITY -lt 20 ]
then
  notify-send 'Check your power!' 'It may be below 20% right now.' --urgency=critical
fi
