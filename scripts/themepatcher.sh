#!/bin/bash
#|---/ /+------------------------------+---/ /|#
#|--/ /-| Script to patch custom theme |--/ /-|#
#|-/ /--| kRHYME7                      |-/ /--|#
#|/ /---+------------------------------+/ /---|#

# error function

# set parameters
ThemeCtl="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/theme.ctl"

Theme_Dir="../"

themes=(
	"BibataIce"
	"Gruvbox"
	"Catppuccin-Latte"
	"Catppuccin-Mocha"
	"Decay-Green"
	"Frosted-Glass"
	"Graphite-Mono"
	"Gruvbox-Retro"
	"Material-Sakura"
	"Rose-Pine"
	"Tokyo-Night"
)

# extract arcs
prefix=("Gtk" "Icon" "Cursor")
declare -A TrgtDir
TrgtDir["Gtk"]="$HOME/.themes"   #mandatory
TrgtDir["Icon"]="$HOME/.icons"   #optional
TrgtDir["Cursor"]="$HOME/.icons" #optional
postfx=("tar.xz" "tar.gz")
GtkFlag=0

# Loop over the themes and extensions
for Fav_Theme in "${themes[@]}"; do
	for pre in "${prefix[@]}"; do
		for ext in "${postfx[@]}"; do
			if [ -f "${Theme_Dir}/sources/${pre}_${Fav_Theme}.${ext}" ]; then
				[ ! -d ${TrgtDir[$pre]} ] && mkdir -p ${TrgtDir[$pre]}
				echo -e "\033[0;32m[Extacting]\033[0m ${Theme_Dir}/sources/${pre}_${Fav_Theme}.${ext} --> ${TrgtDir[$pre]}"
				tar -xf "${Theme_Dir}/sources/${pre}_${Fav_Theme}.${ext}" -C "${TrgtDir[$pre]}"
				if [ ${pre} == "Gtk" ]; then
					GtkFlag=1
				fi
			fi
		done
	done
done

echo -e "\nPatching \033[0;32m--//${Fav_Theme}//--\033[0m from \033[0;34m${Theme_Dir}\033[0m\n"

# required theme files
config=( #!Hard Coded here to atleast Strictly meet requirements.
	"config/hypr/themes/$Fav_Theme.conf"
	"config/kitty/themes/$Fav_Theme.conf"
	"config/Kvantum/$Fav_Theme/$Fav_Theme.kvconfig"
	"config/Kvantum/$Fav_Theme/$Fav_Theme.svg"
	"config/qt5ct/colors/$Fav_Theme.conf"
	"config/rofi/themes/$Fav_Theme.rasi"
	"config/swww/$Fav_Theme/"
	"config/waybar/themes/$Fav_Theme.css"
)

# Loop through the config and check if these exist
for fchk in "${config[@]}"; do
	if [[ -e "${Theme_Dir}/${fchk}" ]]; then
		echo -e "\033[0;32m[OK]\033[0m ${fchk}"
	else
		echo -e "\033[0;31m[ERROR]\033[0m ${fchk} --> does not exist in ${Theme_Dir}/"
		exit 1
	fi
done

mapfile -d '' Wallist < <(find ${Theme_Dir}/config/swww/"${Fav_Theme}"/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | sort -z)

if [ "${#Wallist[@]}" -eq 0 ]; then
	echo -e "\033[0;31m[ERROR]\033[0m No wallpaper found in ${Theme_Dir}/config/swww/"
	exit 1
else
	WallSet=$(basename "${Wallist[0]}")
	echo -e "\nDefault wallpaper selected : \"${WallSet}\"\n"
fi

if [ ${GtkFlag} -eq 0 ]; then
	echo -e "\033[0;31m[ERROR]\033[0m Gtk pack not found --> ${Theme_Dir}/sources/${pre}_${Fav_Theme}.${ext}"
	exit 1
fi

fc-cache -f
