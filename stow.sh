#!/bin/sh

if [ ! -x "/usr/bin/stow" ]; then
    exit
fi

if [ -x "/usr/bin/Hyprland" ]; then
    target=hypr
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/nvim" ]; then
    configdir="${HOME}/.config/${target}nvim"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/sway" ]; then
    configdir="${HOME}/.config/${target}sway"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/waybar" ]; then
    configdir="${HOME}/.config/${target}waybar"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/wezterm" ]; then
    configdir="${HOME}/.config/${target}wezterm"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/wofi" ]; then
    configdir="${HOME}/.config/${target}wofi"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/zsh" ]; then
    stow zsh -t "${HOME}" && echo "stow zsh done!"
fi

