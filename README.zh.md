# 个人配置

[English](README.md)

## 截图

**在 Archlinux 中可以拥有与本人一致的体验！**

## 桌面环境（Wayland 原生）

**在 Archlinux 中安装(需要 aur):**

1. Hyprland 环境

```bash
yay -S ttf-maple-latest ttf-firacode-nerd waybar-hyprland-git wofi polkit-gnome hyprland-git wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
```

2. sway 环境

```bash
yay -S ttf-maple-latest ttf-firacode-nerd waybar wofi polkit-gnome sway-im wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
```

- 窗管: [Hyprland](https://hyprland.org/)/[sway](https://swaywm.org/)
- 任务栏: [waybar](https://github.com/Alexays/Waybar)
- 壁纸: [swaybg](https://github.com/swaywm/swaybg)/[mpvpaper](https://github.com/GhostNaN/mpvpaper)
- 锁屏: [swayidle](https://github.com/swaywm/swayidle) [swaylock-effects](https://github.com/mortie/swaylock-effects)
- 登出: [wlogout](https://github.com/ArtsyMacaw/wlogout)
- 启动: [wofi](https://hg.sr.ht/~scoopta/wofi)
- 截图: [grim](https://sr.ht/~emersion/grim/) [slurp](https://github.com/emersion/slurp)
- 录屏: [wf-recorder](https://github.com/ammen99/wf-recorder)
- 剪切板: [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- 消息通知: [dunst](https://github.com/dunst-project/dunst)

## 终端 (Kitty/Wezterm/Alacritty)

你可以选择任意一个:

- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Wezterm](https://wezfurlong.org/wezterm/)
- [Alacritty](https://github.com/alacritty/alacritty)

本人使用 Kitty:

```bash
yay -S kitty
```

### zsh

安装 zsh:

```bash
yay -S zsh
```

安装插件:

```bash
yay -S zsh-theme-powerlevel10k zsh-syntax-highlighting zsh-autosuggestions
```

或者使用 git:

```bash
mkdir -p ~/.zsh/plugins
cd ~/.zsh/plugins
git clone https://github.com/romkatv/powerlevel10k.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## 编辑器 (Neovim)

Please read [nvim config](nvim/README.md)

## 浏览器 (Firefox)

```bash
yay -S firefox
```

## 工具

```bash
yay -S exa bat rsync
```

- [exa] 代替 ls and tree
- [bat] 代替 cat
- [rsync] 代替 cp and scp

## 配置管理

```bash
yay -S stow
```

可以使用下面的脚本将配置文件软链到用户目录：

```bash
./stow.sh
```

> 如果删除了某个包，可以再次运行该脚本，将会删除该包的软链！
