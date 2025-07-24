--minimalist Wezterm config
--https://gist.github.com/AB9IL/7650164e753d786ef4c7ee066e847ca5
local wezterm = require("wezterm")
return {
	default_prog = default_prog,
	exit_behavior = "Close",
	term = "xterm-256color",
	color_scheme = "MaterialOcean",
	colors = {
		selection_fg = "#000000",
		selection_bg = "#c6cae0",
		background = "#000000",
		foreground = "#c6cae0",
        split = "#00afff",
		ansi = {
			"#0c0c0c",
			"#c50f1f",
			"#13a10e",
			"#c19c00",
			"#82aaff",
			"#881798",
			"#3a96dd",
			"#ccccd0",
		},
		brights = {
			"#767676",
			"#e74856",
			"#16c60c",
			"#f9f1a5",
			"#3b78ff",
			"#b4009e",
			"#61d6d6",
			"#f0f0ff",
		},
    tab_bar = {
        active_tab = {
            bg_color = '#606060', -- Dark grey background for active tab
            fg_color = '#eeeeff', -- White foreground for active tab
        },
        inactive_tab = {
            bg_color = '#303030', -- Dark grey background for active tab
            fg_color = '#808080', -- White foreground for active tab
        },
        inactive_tab_hover = {
            bg_color = '#404040',
            fg_color = '#ddddee',
        },
        new_tab = {
        bg_color = '#202020',
        fg_color = '#808080',
        },
        new_tab_hover = {
        bg_color = '#202020',
        fg_color = '#ddddee',
        },
    },
	},
	window_frame = {
        active_titlebar_bg = '#202020',
		font = wezterm.font({ family = "Noto Sans", weight = 400 }),
	},
	window_decorations = "NONE",
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
	window_background_opacity = 0.9,
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.7,
	},
    enable_kitty_graphics=true,
    enable_kitty_keyboard = true,
	use_dead_keys = false,
	scrollback_lines = 4000,
    max_fps = 120,
	-- Default window dimensions (cols and rows)
	initial_cols = 100,
	initial_rows = 32,
	font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Inconsolata Nerd Font", weight = 300 }),
	font_size = 11,
	line_height = 1.1,
	leader = { key = "a", mods = "CTRL" },
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = true,
	keys = {
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "t", mods = "CTRL", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
		{ key = "N", mods = "CTRL", action = wezterm.action.SpawnWindow },
		{ key = "P", mods = "CTRL", action = wezterm.action.ActivateCommandPalette },
		{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "F11", mods = "NONE", action = wezterm.action.ToggleFullScreen },
	},
}
