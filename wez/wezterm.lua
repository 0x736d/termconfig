local wezterm = require("wezterm")

local padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

local initial_win_size = {
	rows = 128,
	cols = 128,
}

local function font_with_fallback(name, params)
	local names = { name, "OperatorMonoLig Nerd Font", "FiraCode Nerd Font Mono" }
	return wezterm.font_with_fallback(names, params)
end

local leader_key = {
	key = "m",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

local keys = {
	{ key = "m", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{
		key = "h",
		mods = "LEADER|SHIFT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "v",
		mods = "LEADER|SHIFT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "t", mods = "LEADER|SHIFT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = -1 }) },
}

return {
	font = font_with_fallback("OperatorMono Nerd Font", { weight = "Book" }),
	harfbuzz_features = { "zero" },
	font_size = 13.4,
	color_scheme = "Catppuccin",
	line_height = 1.08,
	initial_rows = initial_win_size.rows,
	initial_cols = initial_win_size.cols,
	default_cursor_style = "BlinkingUnderline",
	animation_fps = 60,
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_padding = padding,
	window_background_opacity = 0.98,
	term = "wezterm",
	audible_bell = "Disabled",
	leader = leader_key,
	keys = keys,
}
