# load env
if [ -d ${HOME}/.zsh_env/shell_env ]; then
	for i in ${HOME}/.zsh_env/shell_env/*.sh; do
		if [ -r $i ]; then
			. $i
		fi
	done
	unset i
fi
