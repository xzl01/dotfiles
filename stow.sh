#!/bin/bash

if [ ! -x "/usr/bin/stow" ]; then
    exit
fi

declare -A dict

dict=(
    ["nvim"]="nvim"
    ["wezterm"]="wezterm"
    ["alacritty"]="alacritty"
    ["kitty"]="kitty"
    ["dunst"]="dunst"
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


if [ -x "/usr/bin/zsh" ]; then
    stow -R zsh -t "${HOME}" && echo "stow zsh done!"
else
    stow -D zsh -t "${HOME}" && echo "revome zsh config!"
fi
