# proxy set 设置代理
# proxy unset 取消代理
# proxy test 查看代理情况
alias proxy="source $(dirname $(readlink -f $0))/proxy-script"
# wsl 取消下面注释
#proxy set
# 正常Linux 取消下面注释
proxy set 127.0.0.1
