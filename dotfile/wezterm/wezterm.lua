local wezterm = require("wezterm")

local c = {}

c.default_prog = { "pwsh.exe", "-NoLogo" }
local launch_menu = {}
c.launch_menu = launch_menu

table.insert(launch_menu, {
	label = "PowerShell",
	args = { "pwsh.exe", "-NoLogo" },
})

wezterm.on("new-tab-button-click", function(window, pane, button, default_action)
	wezterm.log_info("new-tab", window, pane, button, default_action)
	if default_action and button == "Left" then
		window:perform_action(wezterm.action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS|DOMAINS" }), pane)
	end
	return false
end)

-- UI
c.front_end = "WebGpu"
c.webgpu_power_preference = "HighPerformance"
c.term = "xterm-256color"
c.font = wezterm.font({
	-- family = "Maple Mono SC NF",
	family = "RecMonoCasual",
	weight = "Regular",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
c.font_size = 13

c.default_cursor_style = "SteadyUnderline"

c.color_scheme = "GruvboxDark"
-- c.background = {
-- 	{
-- 		source = { File = wezterm.config_dir .. "/moon.png" },
-- 		opacity = 0.8,
-- 	},
-- }
-- c.window_background_opacity = 0.9
-- c.win32_system_backdrop = "Mica"
-- c.window_background_gradient = {
-- 	orientation = "Vertical",
-- 	colors = {
-- 		"#0f0c29",
-- 		"#302b63",
-- 		"#24243e",
-- 	},
-- 	-- Specifies the interpolation style to be used.
-- 	-- "Linear", "Basis" and "CatmullRom" as supported.
-- 	-- The default is "Linear".
-- 	interpolation = "Linear",
-- 	blend = "Rgb",
-- }
c.window_padding = { left = 5, right = 8, top = 5, bottom = 0 }
c.enable_scroll_bar = true
c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Key Binding
c.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS|DOMAINS" }),
	},
	{
		key = "C",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "V",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "\\",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

c.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action({ CompleteSelection = "PrimarySelection" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
}

wezterm.on("gui-startup", function()
	local tab, pane, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)
c.window_close_confirmation = "NeverPrompt"

return c
