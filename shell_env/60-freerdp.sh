if command -v wlfreerdp >/dev/null 2>&1; then
	function wlrdp() {
		wlfreerdp +compression +clipboard -themes -wallpaper /gdi:hw /microphone:sys:alsa /sound:sys:alsa /drive:Downloads,${HOME}/Downloads $@
	}
fi
if command -v xfreerdp >/dev/null 2>&1; then
	function xrdp() {
		xfreerdp +compression +clipboard -themes -wallpaper /gdi:hw /microphone:sys:alsa /sound:sys:alsa /drive:Downloads,${HOME}/Downloads $@
	}
fi
