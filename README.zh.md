# 个人配置

[English](README.md) | 中文

## 截图

neofetch:
![neofetch](https://github.com/Groveer/dotfiles/blob/screenshots/1.png?raw=true)

wofi:
![nvim](https://github.com/Groveer/dotfiles/blob/screenshots/2.png?raw=true)

logout:
![logout](https://github.com/Groveer/dotfiles/blob/screenshots/3.png?raw=true)

**在 Archlinux 中可以拥有与本人一致的体验！**

## 桌面环境（Wayland 原生）

**在 Archlinux 中安装(需要 aur):**

1. Hyprland 环境

```bash
yay -S waybar wofi polkit-gnome hyprland wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst libnotify xdg-desktop-portal-wlr wf-recorder wlogout
```

2. sway 环境

```bash
yay -S waybar wofi polkit-gnome sway-im wl-clipboard swayidle swaybg swaylock-effects-git brightnessctl playerctl grim slurp dunst libnotify xdg-desktop-portal-wlr wf-recorder wlogout
```

- 窗管: [Hyprland](https://hyprland.org/)/[sway](https://swaywm.org/)
- 任务栏: [waybar](https://github.com/Alexays/Waybar)
- 壁纸: [swaybg](https://github.com/swaywm/swaybg)/[mpvpaper](https://github.com/GhostNaN/mpvpaper)
- 锁屏: [swayidle](https://github.com/swaywm/swayidle) [swaylock-effects](https://github.com/mortie/swaylock-effects) # Super + L
- 登出: [wlogout](https://github.com/ArtsyMacaw/wlogout) # Ctrl + Alt + Delete
- 启动: [wofi](https://hg.sr.ht/~scoopta/wofi) # Super + D
- 截图: [grim](https://sr.ht/~emersion/grim/) [slurp](https://github.com/emersion/slurp) # Ctrl + Alt + A
- 录屏: [wf-recorder](https://github.com/ammen99/wf-recorder) # Ctrl + Alt + S (再次运行会停止录屏)
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

### bash

使用`./stow.sh`来应用 bash 环境变量，其中主题和 git 插件来自[oh my bash](https://github.com/ohmybash/oh-my-bash)。

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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## 编辑器 (Neovim)

### 开发环境 (Neovim 配置依赖)

安装包：

```bash
yay -S python fnm
```

```bash
python -m venv ~/.python_venv
```

重启终端以应用`python`的环境变量，参考：`shell_env/50-python-venv.sh`，此时可以使用`pip`，使用`./stow.sh`脚本会自动使用国内源：

```bash
./stow.sh
```

```bash
pip install pynvim
```

```bash
fnm install <version/--latest> --node-dist-mirror=https://npmmirror.com/mirrors/node
fnm default <version>
```

重启终端以应用`fnm`的环境变量，参考：`shell_env/fnm.sh`。

安装完`nodejs`和`npm`后，再次更新配置，会自动使用国内源：

```bash
./stow.sh
```

```bash
npm i -g neovim
```

`pip`和`npm`只是 neovim 基本的环境配置，强烈建议跑完 lua 的配置后使用`:checkhealth`命令查看哪些命令未安装，可继续使用相应的包管理进行安装！

### 安装 neovim 配置

默认使用 git ssh 协议，如果使用 http 协议，请先修改文件`.gitmodules`，并设置`url`:

```
https://github.com/Groveer/NvChad.git
```

更新 git 子模块:

```bash
git submodule init && git submodule update
```

```bash
cd nvim && git switch v2.0
```

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

安装包：

```bash
yay -S ttf-maple-nerd ttf-maple-sc-nerd ttf-firacode-nerd
```

若`ttf-maple-sc-nerd`包无法安装时，使用下面方法进行安装：

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
yay -S exa bat rsync htop
```

- [exa] 代替 ls and tree
- [bat] 代替 cat
- [rsync] 代替 cp and scp
- [htop] 代替 top

## 配置管理

```bash
yay -S stow
```

可以使用下面的脚本将配置文件软链到用户目录：

```bash
./stow.sh
```

> 如果删除了某个包，可以再次运行该脚本，将会删除该包的软链！

使用`startde`来启动桌面环境，也可以取消`bash/.bash_profile`(默认取消注释)或`zsh/.zprofile`中的注释来自动启动桌面环境。
