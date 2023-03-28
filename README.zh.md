# 个人配置

[English](README.md)

## 截图

neofetch:
![neofetch](https://github.com/Groveer/dotfiles/blob/screenshots/1.png?raw=true)

nvim:
![nvim](https://github.com/Groveer/dotfiles/blob/screenshots/2.png?raw=true)

logout:
![logout](https://github.com/Groveer/dotfiles/blob/screenshots/3.png?raw=true)

wofi:
![wofi](https://github.com/Groveer/dotfiles/blob/screenshots/4.png?raw=true)

**在 Archlinux 中可以拥有与本人一致的体验！**

## 桌面环境（Wayland 原生）

**在 Archlinux 中安装(需要 aur):**

1. Hyprland 环境

```bash
yay -S waybar-hyprland wofi polkit-gnome hyprland wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
```

2. sway 环境

```bash
yay -S waybar wofi polkit-gnome sway-im wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst xdg-desktop-portal-wlr wf-recorder
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

## 浏览器

firefox:

```bash
yay -S firefox
```

edge:

```bash
yay -S microsoft-edge-stable-bin
```

在 wayland 环境下:

```bash
-enable-features=UseOzonePlatform -ozone-platform=wayland
```

代理:

```bash
--proxy-server="http://127.0.0.1:7890"
```

添加上面的标签到 desktop 文件中：

```bash
sudo vim /usr/share/applications/microsoft-edge.desktop
```

## 字体

1. 使用 [Maple-font](https://github.com/subframe7536/Maple-font)
2. 到 [release](https://github.com/subframe7536/Maple-font/releases) 页面, 并且下载 **MapleMono-SC-NF.zip**.
3. 解压文件：
   ```
   unzip MapleMono-SC-NF.zip
   ```
4. 移动 ttf 文件到 fonts 目录:
   ```
   sudo mv SC-NF/*.ttf /usr/share/fonts/TTF/
   ```
5. 刷新字体缓存:
   ```
   fc-cache -vf
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
