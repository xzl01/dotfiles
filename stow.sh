#!/bin/bash

if [ ! -x "/usr/bin/stow" ]; then
	echo -e "\e[33m Cannot found stow, please install it!\e[0m"
	exit
fi

cur_path=$(pwd)

declare -A dict

# use stow for command config, add: ["command"]="dir"
dict=(
	["Hyprland"]="hypr"
	["nvim"]="nvim"
	["sway"]="sway"
	["alacritty"]="alacritty"
	["mpv"]="mpv"
	["kitty"]="kitty"
	["swaylock"]="swaylock"
	["dunst"]="dunst"
	["neofetch"]="neofetch"
	["wlogout"]="wlogout"
	["fish"]="fish"
	["waybar"]="waybar"
	["swww"]="swww"
	["qt5ct"]="qt5ct"
	["qt6ct"]="qt6ct"
	["rofi"]="rofi"
	["nwg-look"]="nwg-look"
	["kvantummanager"]="Kvantum"
)

cd config

for key in $(echo "${!dict[*]}"); do
	target=${dict[$key]}
	configdir="${HOME}/.config/${target}"
	[ -d "${configdir}" ] && rm -rf "${configdir}" && echo "remove ${target} config!"
	if command -v "${key}" >/dev/null 2>&1; then
		[ ! -d "${configdir}" ] && mkdir -p "${configdir}"
		stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
	fi
done

# use stow for directory config
arr=(
	"gtk-3.0"
	"xsettingsd"
)
for target in ${arr[@]}; do
	configdir="${HOME}/.config/${target}"
	if [ -d ${target} ]; then
		[ -d "${configdir}" ] && rm -rf "${configdir}" && echo "remove ${target} config!"
		mkdir -p "${configdir}" && echo 'mkdir done'
		stow -R ${target} -t "${configdir}" && echo "stow ${target} done!"
	else
		stow -D ${target} -t "${configdir}" && echo "revome ${target} config!"
	fi
done

cd ${cur_path}/directory
# use stow for command config, add: "command"
arr=(
	"gdb"
	"pip"
	"npm"
)
for target in ${arr[@]}; do
	if command -v ${target} >/dev/null 2>&1; then
		stow -R ${target} -t "${HOME}" && echo "stow ${target} done!"
	else
		stow -D ${target} -t "${HOME}" && echo "revome ${target} config!"
	fi
done

# use ln for command config, add ["command"]="target path"
dict=(
	["cargo"]="${HOME}/.cargo"
	["google-chrome-stable"]="${HOME}/.config"
)
for key in $(echo "${!dict[*]}"); do
	value=${dict[$key]}
	if command -v ${key} >/dev/null 2>&1; then
		[ ! -d "${value}" ] && mkdir -p "${value}"
		for file in $(ls ${key}); do
			ln -sf "$(pwd)/${key}/${file}" "${value}/${file}" && echo "ln ${key} done!"
		done
	fi
done

# use ln for dir config, add ["dir"]="target path"
dict=(
	["gtk2"]="${HOME}"
)
for target in $(echo "${!dict[*]}"); do
	value=${dict[$target]}
	if [ -d ${target} ]; then
		[ ! -d ${value} ] && mkdir -p ${value}
		stow -R ${target} -t "${value}" && echo "stow ${target} done!"
	else
		stow -D ${target} -t "${value}" && echo "revome ${target} config!"
	fi
done
cd ${cur_path}
# use ln for generic config, add: ["file path"]="target path"
dict=(
	["startde"]="${HOME}/.local/bin"
	["starship.toml"]="${HOME}/.config"
)
for key in $(echo "${!dict[*]}"); do
	value=${dict[$key]}
	if [ -f ${key} ]; then
		[ ! -d "${value}" ] && mkdir -p "${value}"
		ln -sf "$(pwd)/${key}" "${value}/${key}" && echo "ln ${key} done!"
	fi
done
