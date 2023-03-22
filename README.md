# Personal Configurations

[中文](README.zh.md)

## Screenshots

**You can have the same user experience as me in Archlinux**

## Desktop Environment（Native Wayland）

**Install in Archlinux (need aur):**

1. For Hyprland

```bash
yay -S ttf-firacode-nerd waybar-hyprland-git wofi polkit-gnome hyprland-git wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
```

2. For sway

```bash
yay -S ttf-firacode-nerd waybar wofi polkit-gnome sway-im wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
```

- WM: [Hyprland](https://hyprland.org/)/[sway](https://swaywm.org/)
- Topbar: [waybar](https://github.com/Alexays/Waybar)
- Wallpaper: [swaybg](https://github.com/swaywm/swaybg)/[mpvpaper](https://github.com/GhostNaN/mpvpaper)
- Screensaver: [swayidle](https://github.com/swaywm/swayidle) [swaylock-effects](https://github.com/mortie/swaylock-effects)
- Logout: [wlogout](https://github.com/ArtsyMacaw/wlogout)
- Launcher: [wofi](https://hg.sr.ht/~scoopta/wofi)
- Screenshot: [grim](https://sr.ht/~emersion/grim/) [slurp](https://github.com/emersion/slurp)
- Screen Recorder: [wf-recorder](https://github.com/ammen99/wf-recorder)
- Clipboard: [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- Notification: [dunst](https://github.com/dunst-project/dunst)

## Terminal (Kitty/Wezterm/Alacritty)

You can choose one:

- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Wezterm](https://wezfurlong.org/wezterm/)
- [Alacritty](https://github.com/alacritty/alacritty)

I use the Kitty:

```bash
yay -S kitty
```

### zsh

Install zsh:

```bash
yay -S zsh
```

Install plugins:

```bash
yay -S zsh-theme-powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
```

or use git:

```bash
mkdir -p ~/.zsh/plugins
cd ~/.zsh/plugins
git clone https://github.com/romkatv/powerlevel10k.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## Editor (Neovim)

Please read [my nvim config](nvim/README.md)

## Browser

### firefox

```bash
yay -S firefox
```

### edge

```bash
yay -S microsoft-edge-stable-bin
```

in wayland:

```bash
-enable-features=UseOzonePlatform -ozone-platform=wayland
```

proxy:

```bash
--proxy-server="http://127.0.0.1:7890"
```

add these flags in desktop file:

```bash
sudo vim /usr/share/applications/microsoft-edge.desktop
```

## Tools

```bash
yay -S exa bat rsync
```

- [exa] instead ls and tree
- [bat] instead cat
- [rsync] instead cp and scp

## Configs Manager

```bash
yay -S stow
```

You can use this script to softlink the configuration file to the user directory:

```bash
./stow.sh
```

> If you removed some one package, you can run it again for remove softlink!
