local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name,
		"FiraCode Nerd Font", }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "FiraCode Nerd Font"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
	-- color_scheme = 'Catppuccin Mocha',
	color_scheme = 'rose-pine',
	-- Font config
	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true }),
		},
		{
			italic = false,
			font = font_with_fallback(font_name, { bold = true }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { bold = true }),
		},
	},
	warn_about_missing_glyphs = false,
	font_size = 12,
	line_height = 1.0,
	dpi = 96.0,
	-- Cursor style
	default_cursor_style = "BlinkingUnderline",
	-- X11
	enable_wayland = true,
	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		{ -- 搜索
			key = "f",
			mods = 'CTRL',
			action = wezterm.action.Search {
				CaseInSensitiveString = '' -- 大小写不敏感
				-- CaseSensitiveString = ''-- 大小写敏感
			}
		},
		{
			key = "0",
			mods = "CTRL",
			action = "ResetFontSize"
			-- CTRL+= 重置字体大小
		},
		{
			key = "=",
			mods = "CTRL",
			action = "IncreaseFontSize"
			-- CTRL++ 放大字体
		},
		{
			key = "-",
			mods = "CTRL",
			action = "DecreaseFontSize"
		},
		{
			key = [[\]],
			mods = "CTRL|ALT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}), -- CTRL+ALT+\ 水平分割
		},
		{
			key = [[\]],
			mods = "CTRL",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}), -- CTRL+\ 垂直分割
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
			-- CTRL+q 关闭当前窗口
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
			-- CTRL+SHIFT+h 切换到左边窗口
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
			-- CTRL+SHIFT+l 切换到右边窗口
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
			-- CTRL+SHIFT+k 切换到上边窗口
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
			-- CTRL+SHIFT+j 切换到下边窗口
		},
		{
			key = "h",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
			-- CTRL+SHIFT+ALT+h 调整窗口大小
		},
		{
			key = "l",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
			-- CTRL+SHIFT+ALT+l 调整窗口大小
		},
		{
			key = "k",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
			-- CTRL+SHIFT+ALT+k 调整窗口大小
		},
		{
			key = "j",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
			-- CTRL+SHIFT+ALT+j 调整窗口大小
		},
		{ -- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
			-- CTRL+t 新建标签页
		},
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
			-- CTRL+w 关闭当前标签页
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action({ ActivateTabRelative = 1 }),
			-- CTRL+Tab 切换到下一个标签页
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
			-- CTRL+SHIFT+Tab 切换到上一个标签页
		},
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
			-- CTRL+x 进入复制模式
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
			-- CTRL+SHIFT+v 粘贴
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
			-- CTRL+SHIFT+c 复制
		},
	},
	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	-- Padding
	window_padding = {
		left = 25,
		right = 25,
		top = 25,
		bottom = 25,
	},
	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = false,
	-- General
	automatically_reload_config = true, -- 自动重载配置
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }, -- 窗口不活跃时的颜色
	window_background_opacity = 0.7, -- 透明度
	window_close_confirmation = "NeverPrompt", -- 关闭窗口时不提示
	window_frame = { active_titlebar_bg = "#45475a", font = font_with_fallback(font_name, { bold = true }) }, -- 标题栏字体
}
