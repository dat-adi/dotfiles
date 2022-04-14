#!/bin/bash

# This script has been taken from realaravinth's dotfiles configuration for sway
# https://github.com/realaravinth/dotfiles/blob/master/.config/i3/scripts/statusbar.sh

readonly REFRESH_CYCLE=1 # in seconds

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOCOLOR='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m' GREEN='#FF5733'
    echo $GREEN
  else
    NOCOLOR='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo -e "${1-}"
}



battery() {
	# time_left=$(acpi -i | head -n 1 |  cut -d "%" -f 2 | tr ',' ' ')
	battery_status=$(acpi -i | head -n 1 | cut -d ":" -f 2 | cut -d "%" -f 1 | tr ',' ' ')
	echo "🔋$battery_status%"
}

now() {
	echo "$(date +'%a %F %H:%M')"
}

loadfactor() {
	load=$(uptime | cut -d ':' -f 5 | cut -d ',' -f 1 )
	# | bc)
	echo $load
##	 echo "raw load: $load"
#	if [ $(echo "$load < 1" | bc) -ne 0 ]
#	then
#		msg "${GREEN}0$load"
#	elif [ $(echo "$load < 2" | bc) -ne 0 ]
#	then
#		msg "${YELLOW}$load"
#	elif [ $(echo "$load < 3" | bc) -ne 0 ]
#	then
#		msg "${ORANGE}$load"
#	else
#		msg "${RED}$load"
#	fi
}

main() {
	setup_colors
	while true
	do 
		load=$(loadfactor)
		echo "$(now) | $(battery)"
		sleep $REFRESH_CYCLE
	done
}

#main
setup_colors
main
