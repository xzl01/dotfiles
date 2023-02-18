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

if [ -x "/usr/bin/alacritty" ]; then
    target=alacritty
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

if [ -x "/usr/bin/mpv" ]; then
    target=mpv
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/mpv" ]; then
    target=mpv
    configdir="${HOME}/.config/${target}"
    [ ! -d "${configdir}" ] && mkdir -p "${configdir}"
    stow -R "${target}" -t "${configdir}" && echo "stow ${target} done!"
fi

if [ -x "/usr/bin/zsh" ]; then
    stow -R zsh -t "${HOME}" && echo "stow zsh done!"
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
