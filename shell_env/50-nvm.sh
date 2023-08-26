# Archlinux 中安装nvm包
sh='/usr/share/nvm/init-nvm.sh'
[ -f ${sh} ] && source ${sh}
# wget or curl install.sh
NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
