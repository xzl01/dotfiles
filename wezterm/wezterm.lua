local wezterm = require("wezterm")
local font = wezterm.font_with_fallback({
	"Maple Mono SC NF",
	"Noto Sans CJK SC",
})

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Dracula (Official)"
config.font = font
config.font_size = 12
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

return config
