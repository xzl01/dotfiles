function _omb_util_defun_print {
	builtin eval -- "function $1 { local $3; $2 \"\$@\" && printf '%s\n' \"\${$3}\"; }"
}

function _omb_util_command_exists {
	type -t -- "$@" &>/dev/null # bash-4.0
}

function _omb_util_function_exists {
	declare -F "$@" &>/dev/null # bash-3.2
}

function _omb_util_binary_exists {
	type -P -- "$@" &>/dev/null # bash-4.0
}

function _omb_util_setexit {
	return "$1"
}

function _omb_util_alias {
	case ${OMB_DEFAULT_ALIASES:-enable} in
	disable) return 0 ;;
	check) alias -- "${1%%=*}" &>/dev/null && return 0 ;;
	enable) ;;
	*)
		_omb_log_error "invalid value: OMB_DEFAULT_ALIASES='${OMB_DEFAULT_ALIASES-}' (expect: enable|disable|check)" >&2
		return 2
		;;
	esac
	alias -- "$1"
}

function _omb_util_prompt_command_hook {
	local status=$? lastarg=$_ hook
	for hook in "${_omb_util_prompt_command[@]}"; do
		_omb_util_setexit "$status" "$lastarg"
		eval -- "$hook"
	done
	_omb_util_setexit "$status"
}

function _omb_util_add_prompt_command {
	local other
	for other in "${_omb_util_prompt_command[@]}"; do
		[[ $1 == "$other" ]] && return 0
	done
	_omb_util_prompt_command+=("$1")

	if [[ ! $_omb_util_prompt_command_setup ]]; then
		_omb_util_prompt_command_setup=1
		local hook=_omb_util_prompt_command_hook

		# See if we need to use the overriden version
		if _omb_util_function_exists append_prompt_command_override; then
			append_prompt_command_override "$hook"
			return
		fi

		# Set OS dependent exact match regular expression
		local prompt_re
		if [[ $OSTYPE == darwin* ]]; then
			# macOS
			prompt_re='[[:<:]]'$hook'[[:>:]]'
		else
			# Linux, FreeBSD, etc.
			prompt_re='\<'$hook'\>'
		fi
		[[ $PROMPT_COMMAND =~ $prompt_re ]] && return 0

		if ((_omb_bash_version >= 50100)); then
			local other
			for other in "${PROMPT_COMMAND[@]}"; do
				[[ $hook == "$other" ]] && return 0
			done
			PROMPT_COMMAND+=("$hook")
		else
			PROMPT_COMMAND="$hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
		fi
	fi
}
