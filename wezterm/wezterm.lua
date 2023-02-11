local wezterm = require("wezterm")
local font = wezterm.font_with_fallback({
	"FiraCode Nerd Font",
	"Noto Sans CJK SC",
})
return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
	use_ime = true,
	color_scheme = "Dracula (Official)",
	font = font,
	font_size = 12,
	tab_bar_at_top = true,
	enable_scroll_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
	},
	window_decorations = "RESIZE",
	window_frame = {
		font = font,
		font_size = 9,
		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "rgba(0,0,0,0.3)",
		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "rgba(0% 0% 0% 30%)",
	},
	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 0.4,
	window_close_confirmation = "NeverPrompt"
}
