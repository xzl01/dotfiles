#!/bin/bash

if [ ! -x "/usr/bin/stow" ]; then
    exit
fi

declare -A dict

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
for key in $(echo "${!dict[*]}")
do
    target=${dict[$key]}
    configdir="${HOME}/.config/${target}"
    [ -d "${configdir}" ] && rm -rf "${configdir}" && echo "remove ${target} config!"
    if [ -x "/usr/bin/${key}" ]; then
        [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
        stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
    fi
done

arr=(
    "zsh"
    "gdb"
)
for target in ${arr[@]}
do
    if [ -x "/usr/bin/${target}" ]; then
        stow -R ${target} -t "${HOME}" && echo "stow ${target} done!"
    else
        stow -D ${target} -t "${HOME}" && echo "revome ${target} config!"
    fi
done

if [ -f "bg.jpg" ]; then
    target=bg.jpg
    configdir="${HOME}/.local/share/backgrounds"
    [ ! -d "${configdir}" ] && mkdir "${configdir}"
    ln -sf "$(pwd)/${target}" "${configdir}/${target}" && echo "ln ${target} done!"
fi

if [ -f "angry_birds.mov" ]; then
    target=angry_birds.mov
    configdir="${HOME}/.local/share/backgrounds"
    [ ! -d "${configdir}" ] && mkdir "${configdir}"
    ln -sf "$(pwd)/${target}" "${configdir}/${target}" && echo "ln ${target} done!"
fi

if [ -x "startde" ]; then
    target=startde
    configdir="${HOME}/.local/bin"
    [ ! -d "${configdir}" ] && mkdir "${configdir}"
    ln -sf "$(pwd)/${target}" "${configdir}/${target}" && echo "ln ${target} done!"
fi
