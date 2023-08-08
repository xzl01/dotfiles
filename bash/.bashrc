#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f /etc/bash_completion ] && source /etc/bash_completion

# load env
if [ -d ${HOME}/.bash_env ]; then
	for i in ${HOME}/.bash_env/*.sh; do
		if [ -r $i ]; then
			. $i
		fi
	done
	unset i
fi
