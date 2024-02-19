#!/usr/bin/env sh

# set variables
ScrDir=$(dirname "$(realpath "$0")")
source $ScrDir/globalcontrol.sh
kittyDir="${ConfDir}/kitty/themes"

if ! grep -q 'include themes/wallbash-kitty.conf' "${kittyDir}/kitty.conf"; then
	echo "include themes/wallbash-kitty.conf" >>"${kittyDir}/kitty.conf"
fi

#Override kitty config
if [ "${EnableWallDcol}" -ne 1 ]; then
	ln -fs ${kittyDir}/${gtkTheme}.conf ${kittyDir}/theme.conf
else
	ln -fs ${kittyDir}/Wall-Dcol.conf ${kittyDir}/theme.conf
fi

killall -SIGUSR1 kitty
