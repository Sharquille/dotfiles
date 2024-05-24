-- wezterm api
local wezterm = require("wezterm")

return {
	-- color_scheme
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font = wezterm.font("BlexMono Nerd Font Mono", {
		weight = "Bold",
		italic = true,
	}),
	font_size = 22.6,
	macos_window_background_blur = 30,
	window_background_opacity = 0.86,
	window_decorations = "RESIZE",
}
