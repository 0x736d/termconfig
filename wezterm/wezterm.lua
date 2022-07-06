local ok, wez = pcall(require, "wezterm")

if not ok then
	return {}
end

local catppuccin = require("user.colors.catppuccin").setup({
	sync = true,
	-- available flavours: "latte" | "frappe" | "macchiato" | "mocha"
	sync_flavours = {
		light = "latte",
		dark = "mocha",
	},
	flavour = "mocha",
})
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
	colors = catppuccin,
	font_size = 12,
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	use_resize_increments = true,
	window_decorations = "NONE",
	window_background_opacity = 0.95,
	window_padding = {
		left = 3,
		right = 1,
		top = 4,
		bottom = 0,
	},
	animation_fps = 240,
	default_cursor_style = "SteadyUnderline",
	term = "wezterm",
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	leader = keymaps.leader,
	keys = keymaps.keys,
}

return M
