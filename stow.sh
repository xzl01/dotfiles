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
    ["eww"]="eww"
)
for key in $(echo "${!dict[*]}")
do
    target=${dict[$key]}
    configdir="${HOME}/.config/${target}"
    if [ -x "/usr/bin/${key}" ]; then
        [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
        if [ "${key}" == "nvim" ]; then
            args="--ignore=.github"
        else
            args=""
        fi
        stow -R "${target}" -t "${configdir}" "${args}" && echo "stow ${target} done!"
    else
        [ -d "${configdir}" ] && rm -rf "${configdir}" && echo "remove ${target} config!"
    fi
done


if [ -x "/usr/bin/zsh" ]; then
    stow -R zsh -t "${HOME}" && echo "stow zsh done!"
else
    stow -D zsh -t "${HOME}" && echo "revome zsh config!"
fi

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
