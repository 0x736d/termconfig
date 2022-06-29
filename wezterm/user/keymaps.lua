local ok, wez = pcall(require, "wezterm")

if not ok then
	return {}
end

local M = {}

M.leader = {
	key = "m",
	mods = "CTRL",
	timeout_milliseconds = 750,
}

M.keys = {
	{ key = "m", mods = "LEADER|CTRL", action = wez.action({ SendString = "\x01" }) },
	{
		key = "h",
		mods = "LEADER|SHIFT",
		action = wez.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "v",
		mods = "LEADER|SHIFT",
		action = wez.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wez.action.ShowLauncherArgs({ flags = "FUZZY|TABS", title = "Select tab" }),
	},
	-- panes
	{ key = "h", mods = "LEADER", action = wez.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wez.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wez.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wez.action({ ActivatePaneDirection = "Right" }) },
	{ key = "LeftArrow", mods = "ALT", action = wez.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "ALT", action = wez.action.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "ALT", action = wez.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "ALT", action = wez.action.AdjustPaneSize({ "Down", 1 }) },

	-- tabs
	{ key = "t", mods = "LEADER|SHIFT", action = wez.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "1", mods = "LEADER", action = wez.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wez.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wez.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wez.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wez.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wez.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wez.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wez.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wez.action({ ActivateTab = -1 }) },
}

return M
