if command -v wlfreerdp >/dev/null 2>&1; then
	function wlrdp() {
		wlfreerdp /v:$1 /u:$2 /p:$3 +compression +clipboard -themes -wallpaper /gdi:hw /microphone:sys:alsa /sound:sys:alsa
	}
fi
if command -v xfreerdp >/dev/null 2>&1; then
	function xrdp() {
		echo "cmd: xfreerdp /v:$1 /u:$2 /p:$3 ${PARAMETER}"
		xfreerdp /v:$1 /u:$2 /p:$3 $+compression +clipboard -themes -wallpaper /gdi:hw /microphone:sys:alsa /sound:sys:alsa
	}
fi
