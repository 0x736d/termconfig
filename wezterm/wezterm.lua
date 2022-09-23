local ok, wez = pcall(require, "wezterm")

if not ok then
	return {}
end

local function select_from_appearance(appr)
	if appr:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local keymaps = require("user.keymaps")

local fonts = {
	{
		family = "JetBrains Mono",
		weight = "Medium",
		stretch = "Normal",
		harfbuzz_features = { "zero" },
	},
	{
		family = "Cascadia Code PL",
		weight = "Medium",
		stretch = "Normal",
		harfbuzz_features = { "zero", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss20", "cv05" },
	},
	{
		family = "Fira Code",
		weight = "Medium",
		stretch = "Normal",
		harfbuzz_features = {
			"ss01",
			"ss02",
			"ss03",
			"ss04",
			"ss05",
			"ss06",
			"ss07",
			"ss08",
			"ss09",
			"cv31",
			"cv29",
			"cv30",
			"cv05",
			"zero",
		},
	},
}

local M = {
	front_end = "OpenGL",
	font = wez.font_with_fallback(fonts),
	font_rules = {
		{
			italic = true,
			intensity = "Normal",
			font = wez.font_with_fallback({
				{
					family = "Cascadia Code PL",
					weight = "Medium",
					italic = true,
					harfbuzz_features = { "ss01", "zero", "cv05" },
				},
			}),
		},
		{

			italic = true,
			intensity = "Bold",
			font = wez.font_with_fallback({
				{
					family = "Cascadia Code PL",
					weight = "Bold",
					italic = true,
					harfbuzz_features = { "ss01", "zero", "cv05" },
				},
			}),
		},
	},
	color_scheme = select_from_appearance(wez.gui.get_appearance()),
	font_size = 13.8,
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	use_resize_increments = true,
	window_decorations = "NONE",
	window_background_opacity = 0.95,
	window_padding = {
		left = 2,
		right = 0,
		top = 0,
		bottom = 0,
	},
	animation_fps = 60,
	default_cursor_style = "SteadyUnderline",
	term = "wezterm",
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	leader = keymaps.leader,
	keys = keymaps.keys,
}

return M
