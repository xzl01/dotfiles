export PATH=$PATH:~/.local/bin

HISTSIZE=5000

if command -v vim >/dev/null 2>&1; then
	export EDITOR=vim
fi
if command -v nvim >/dev/null 2>&1; then
	export EDITOR=nvim
fi

# export http_proxy=http://127.0.0.1:7890
# export https_proxy=$http_proxy
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# need exa package v0.11.0 or higher
if command -v eza >/dev/null 2>&1; then
	alias ls="eza --icons"
	alias l="eza -al --icons"
	alias ll="eza -l --icons"
	alias tree="eza -T --icons"
fi

# need bat package
if command -v bat >/dev/null 2>&1; then
	alias cat="bat"
fi

# debian need batcat
if command -v batcat >/dev/null 2>&1; then
	alias cat="batcat"
fi

# need rsync package
if command -v rsync >/dev/null 2>&1; then
	alias cp="rsync -avP"
fi

alias date-changelog="LC_ALL=C date +'%a, %d %b %Y %T %z'"
