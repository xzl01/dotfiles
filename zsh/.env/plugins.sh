if [ -d ${HOME}/.zsh/plugins ]; then
	source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
	source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
