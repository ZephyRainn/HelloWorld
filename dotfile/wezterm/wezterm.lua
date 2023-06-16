local wez = require 'wezterm'

local cfg = {}

if wez.config_builder then
      cfg = wez.config_builder()
end


-- General
cfg.check_for_updates = true
cfg.default_prog = {'pwsh', '-NoLogo'}


-- UI
cfg.font = wez.font('CodeMono', { weight = 'Medium'} )
cfg.font_size = 13
cfg.adjust_window_size_when_changing_font_size = false
cfg.color_scheme = 'Dracula'


-- Keymapping
cfg.disable_default_key_bindings = true
cfg.keys = {
      { action = wez.action.ActivateCommandPalette, mods = 'CTRL|SHIFT', key =     'P' },
      { action = wez.action.CopyTo     'Clipboard', mods = 'CTRL|SHIFT', key =     'C' },
      { action = wez.action.PasteFrom  'Clipboard', mods = 'CTRL|SHIFT', key =     'V' },
      { action = wez.action.ToggleFullScreen      , mods =        'ALT', key = 'Enter' },
      { action = wez.action.SplitHorizontal       , mods =       'CTRL', key =    '\\' },
      { action = wez.action.SplitVertical         , mods =       'CTRL', key =     '-' },
      { action = wez.action.CloseCurrentPane { confirm = true }, mods = 'CTRL', key = 'w' },
}


-- WSL
cfg.wsl_domains = {
      {
            name = 'WSL:Arch',
            distribution = 'Arch',
            username = 'zainc',
            default_cwd = '~',
            default_prog = {'bash', '-l'},
      },
}


-- Misc
cfg.audible_bell = 'Disabled'
cfg.scrollback_lines = 10000
cfg.window_close_confirmation = 'NeverPrompt'

return cfg
