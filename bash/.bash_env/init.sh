# load env
if [ -d ${HOME}/.bash_env/shell_env ]; then
	for i in ${HOME}/.bash_env/shell_env/*.sh; do
		if [ -r $i ]; then
			. $i
		fi
	done
	unset i
fi

# load osh
if [ -d ${HOME}/.bash_env/osh ]; then
	for i in ${HOME}/.bash_env/osh/*.sh; do
		if [ -r $i ]; then
			. $i
		fi
	done
	unset i
fi
