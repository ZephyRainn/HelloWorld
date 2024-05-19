local wezterm = require('wezterm')
local platform = require('utils.platform')()

return {
   term = "xterm-256color",
   animation_fps = 120,
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   enable_wayland = false,

   -- color scheme
   -- colors = colors,
   color_scheme = "Gruvbox dark, medium (base16)",

   -- background
   window_background_opacity = 1,
   win32_system_backdrop = 'Acrylic',
   window_background_gradient = {
      colors = { '#1D261B', '#261A25' },
      -- Specifices a Linear gradient starting in the top left corner.
      orientation = { Linear = { angle = -45.0 } },
   },
   -- background = {
   --    {
   --       source = { File = wezterm.config_dir .. '/backdrops/space.jpg' },
   --    },
   --    {
   --       source = { Color = '#1A1B26' },
   --       height = '100%',
   --       width = '100%',
   --       opacity = 0.95,
   --    },
   -- },

   -- scrollbar
   -- enable_scroll_bar = true,
   -- min_scroll_bar_height = "3cell",
   -- colors = {
   --    scrollbar_thumb = '#303030',
   -- },

   -- tab
   enable_tab_bar = true,
   use_fancy_tab_bar = true,
   hide_tab_bar_if_only_one_tab = true,
   show_new_tab_button_in_tab_bar = false,
   tab_max_width = 25,
   switch_to_last_active_tab_when_closing_tab = true,

   -- cursor
   default_cursor_style = "SteadyBlock",
   -- cursor_blink_ease_in = "Constant",
   -- cursor_blink_ease_out = "Constant",
   -- cursor_blink_rate = 700,

   -- font
   bold_brightens_ansi_colors = "BrightOnly",

   -- window
   adjust_window_size_when_changing_font_size = false,
   window_decorations = "INTEGRATED_BUTTONS",
   integrated_title_button_style = platform.is_win and "Windows" or "Gnome",
   integrated_title_button_color = "auto",
   integrated_title_button_alignment = "Right",
   initial_cols = 100,
   initial_rows = 25,
   window_padding = {
      left = 3,
      right = 3,
      top = 3,
      bottom = 3,
   },
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#252525',
      inactive_titlebar_bg = '#333333',
      font = wezterm.font_with_fallback({
         {family = "RecMonoCasual Nerd Font Mono", weight = "Bold"},
         {family = "Maple Mono SC NF", weight = "Bold"}
      }),
      font_size = 12,
   },
   inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
