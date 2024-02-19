#!/bin/bash
#|---/ /+------------------------------+---/ /|#
#|--/ /-| Script to extact sources     |--/ /-|#
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

if [ ${GtkFlag} -eq 0 ]; then
	echo -e "\033[0;31m[ERROR]\033[0m Gtk pack not found --> ${Theme_Dir}/sources/${pre}_${Fav_Theme}.${ext}"
	exit 1
fi

fc-cache -f
