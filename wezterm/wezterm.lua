local ok, wez = pcall(require, "wezterm")

if not ok then
	return {}
end

local function select_from_appearance(appr)
	if appr:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Mocha"
	end
end

local keymaps = require("user.keymaps")

local fonts = {
	{
		family = "JetBrains Mono",
		weight = "Medium",
		harfbuzz_features = { "zero" },
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
					family = "Cascadia Code",
					weight = "Regular",
					italic = true,
					harfbuzz_features = { "zero", "cv05" },
				},
			}),
		},
		{

			italic = true,
			intensity = "Bold",
			font = wez.font_with_fallback({
				{
					family = "Cascadia Code",
					weight = "Bold",
					italic = true,
					harfbuzz_features = { "zero", "cv05" },
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
	window_background_opacity = 0.98,
	window_padding = {
		left = 1,
		right = 0,
		top = 5,
		bottom = 0,
	},
	animation_fps = 120,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	default_cursor_style = "BlinkingUnderline",
	term = "wezterm",
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	leader = keymaps.leader,
	keys = keymaps.keys,
	underline_thickness = "0.1cell",
}

return M
