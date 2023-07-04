# Personal Configurations

English | [中文](README.zh.md)

## Screenshots

neofetch:
![neofetch](https://github.com/Groveer/dotfiles/blob/screenshots/1.png?raw=true)

wofi:
![nvim](https://github.com/Groveer/dotfiles/blob/screenshots/2.png?raw=true)

logout:
![logout](https://github.com/Groveer/dotfiles/blob/screenshots/3.png?raw=true)

**You can have the same user experience as me in Archlinux**

## Desktop Environment（Native Wayland）

**Install in Archlinux (need aur):**

1. For Hyprland

```bash
yay -S waybar wofi polkit-gnome hyprland wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst libnotify xdg-desktop-portal-wlr wf-recorder wlogout
```

2. For sway

```bash
yay -S waybar wofi polkit-gnome sway-im wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst libnotify xdg-desktop-portal-wlr wf-recorder wlogout
```

- WM: [Hyprland](https://hyprland.org/)/[sway](https://swaywm.org/)
- Topbar: [waybar](https://github.com/Alexays/Waybar)
- Wallpaper: [swaybg](https://github.com/swaywm/swaybg)/[mpvpaper](https://github.com/GhostNaN/mpvpaper)
- Screensaver: [swayidle](https://github.com/swaywm/swayidle) [swaylock-effects](https://github.com/mortie/swaylock-effects) # Super + L
- Logout: [wlogout](https://github.com/ArtsyMacaw/wlogout) # Ctrl + Alt + Delete
- Launcher: [wofi](https://hg.sr.ht/~scoopta/wofi) # Super + D
- Screenshot: [grim](https://sr.ht/~emersion/grim/) [slurp](https://github.com/emersion/slurp) # Ctrl + Alt + A
- Screen Recorder: [wf-recorder](https://github.com/ammen99/wf-recorder) # Ctrl + Alt + S (re-run to stop)
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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## Editor (Neovim)

Please read [my nvim config](https://github.com/Groveer/nvimdots)

Default use git ssh, if you use http, modify `.gitmodules`, set `url`:

```
https://github.com/Groveer/nvimdots.git
```

Update git submodule:

```bash
git submodule init && git submodule update
```

```bash
cd nvim && git switch new
```

If use git http, modify `nvim/lua/core/settings`, set `use_ssh` to `false`.

### Developer Environment

Install packages:

```bash
yay -S python fnm
```

```bash
python -m venv ~/.python_venv
```

Restart Terminal for apply python environment, then you can use `pip` command. look: `zsh/.zsh_env/python-venv.sh`.

```bash
pip install pynvim
```

```bash
fnm install <version/--latest>
fnm default <version>
```

Restart terminal for apply fnm environment, look: `zsh/.zsh_env/fnm.sh`.

```bash
sudo npm i -g neovim
```

`pip` and `npm` are just the basic environment configuration of neovim, it is highly recommended to use the `:checkhealth` command to see which commands are not installed after running the configuration of lua, you can continue to use the corresponding package management for installation!

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

## Font

install package:

```bash
yay -S ttf-maple-nerd ttf-maple-sc-nerd ttf-firacode-nerd
```

if cannot install `ttf-maple-sc-nerd`, use the following method:

1. use [Maple-font](https://github.com/subframe7536/Maple-font)
2. to [release](https://github.com/subframe7536/Maple-font/releases) page, and download **MapleMono-SC-NF.zip**.
3. unzip the file：
   ```
   unzip MapleMono-SC-NF.zip
   ```
4. mv ttf file to fonts dir:
   ```
   sudo mv SC-NF/*.ttf /usr/share/fonts/TTF/
   ```
5. refresh fonts cache:
   ```
   fc-cache -vf
   ```

## Tools

```bash
yay -S exa bat rsync htop
```

- [exa] instead ls and tree
- [bat] instead cat
- [rsync] instead cp and scp
- [htop] instead top

## Configs Manager

```bash
yay -S stow
```

You can use this script to softlink the configuration file to the user directory:

```bash
./stow.sh
```

> If you removed some one package, you can run it again for remove softlink!

Use `startde` to start desktop environment. It is also possible to uncomment `zsh/.zprofile` to automatically start the desktop environment.
