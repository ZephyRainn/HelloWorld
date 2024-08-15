local wezterm = require('wezterm')

return {
   term = "xterm-256color",
   animation_fps = 120,
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',

   -- color scheme
   -- colors = colors,
   color_scheme = "Gruvbox dark, medium (base16)",

   -- background
   window_background_opacity = 0.90,
   macos_window_background_blur = 50,
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
   initial_cols = 100,
   initial_rows = 30,
   window_padding = {
      left = 2,
      right = 2,
      top = 2,
      bottom = 2,
   },
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#252525',
      inactive_titlebar_bg = '#333333',
      font = wezterm.font_with_fallback({
         {family = "Monaco", weight = "Bold"},
      }),
      font_size = 12,
   },
}
