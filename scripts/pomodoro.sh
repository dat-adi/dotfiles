#!/usr/bin/bash

# Get the number of tasks
read -p '[=>] Enter the number of tasks: ' tasknum
tasks=()

IFS=$'\n'
for (( k=1; k <=$tasknum; k++ )); do
  read -p '[<=] Enter task: ' taskdef
  tasks+=($taskdef)
done
unset IFS

# Warning notification
notify-send 'Pomodoro starts in 5!' "Thank you for doing something with your life!"
# 1. 25 min for one task
# 2. 5 min break
sleep 5
for k in "${tasks[@]}"; do
  notify-send 'Task!' "$k" --urgency=critical
  sleep 25m
  notify-send "You are done with $k!" 'Now, we transition over to the break.'
  sleep 5
  notify-send 'The break starts now!' 'Please rest for 5 minutes.'
  sleep 5m
done

notify-send 'You are done with your tasks!' 'Good job getting stuff done!'
