local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Theme
config.color_scheme = "Catppuccin Macchiato"

-- Font
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14.0

-- Window
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Automatically switch theme based on system appearance
wezterm.on("window-config-reloaded", function(window)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()

	if appearance:find("Dark") then
		overrides.color_scheme = "Catppuccin Macchiato"
	else
		overrides.color_scheme = "Catppuccin Latte"
	end

	window:set_config_overrides(overrides)
end)

return config
