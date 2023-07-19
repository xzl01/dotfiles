#!/bin/bash

if [ ! -x "/usr/bin/stow" ]; then
	exit
fi

declare -A dict

# use stow for command config, add: ["command"]="dir"
dict=(
	["Hyprland"]="hypr"
	["nvim"]="nvim"
	["sway"]="sway"
	["waybar"]="waybar"
	["wezterm"]="wezterm"
	["alacritty"]="alacritty"
	["wofi"]="wofi"
	["mpv"]="mpv"
	["kitty"]="kitty"
	["swaylock"]="swaylock"
	["dunst"]="dunst"
	["neofetch"]="neofetch"
	["wlogout"]="wlogout"
)
for key in $(echo "${!dict[*]}"); do
	target=${dict[$key]}
	configdir="${HOME}/.config/${target}"
	[ -d "${configdir}" ] && rm -rf "${configdir}" && echo "remove ${target} config!"
	if command -v "${key}" >/dev/null 2>&1; then
		[ ! -d "${configdir}" ] && mkdir -p "${configdir}"
		stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
	fi
done

# use stow for command config, add: "command"
arr=(
	"zsh"
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

# use ln for generic config, add: ["file path"]="target path"
dict=(
	["bg.jpg"]="${HOME}/.local/share/backgrounds"
	["bg.gif"]="${HOME}/.local/share/backgrounds"
	["startde"]="${HOME}/.local/bin"
)
for key in $(echo "${!dict[*]}"); do
	value=${dict[$key]}
	if [ -f ${key} ]; then
		[ ! -d "${value}" ] && mkdir "${value}"
		ln -sf "$(pwd)/${key}" "${value}/${key}" && echo "ln ${key} done!"
	fi
done

# use ln for command config, add ["command"]="target path"
dict=(
	["cargo"]="${HOME}/.cargo"
)
for key in $(echo "${!dict[*]}"); do
	value=${dict[$key]}
	if command -v ${key} >/dev/null 2>&1; then
		[ ! -d "${value}" ] && mkdir "${value}"
		for file in $(ls ${key}); do
			ln -sf "$(pwd)/${key}/${file}" "${value}/${file}" && echo "ln ${key} done!"
		done
	fi
done
