#!/bin/sh

if [ ! -x "/usr/bin/stow" ]; then
    exit
fi

if [ -x "/usr/bin/Hyprland" ]; then
    target=hypr
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/nvim" ]; then
    target=nvim
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" --ignore ".github" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/sway" ]; then
    target=sway
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/waybar" ]; then
    target=waybar
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/wezterm" ]; then
    target=wezterm
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/wofi" ]; then
    target=wofi
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/zsh" ]; then
    stow -R zsh -t "${HOME}" && echo "stow zsh done!"
fi

