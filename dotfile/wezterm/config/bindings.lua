local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
elseif platform.is_linux then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER_REV = 'ALT|CTRL'
end

local keys = {
   -- misc/useful --
   { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
   { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
   { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
   { key = 'F4', mods = 'NONE', action = act.ShowTabNavigator },
   { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
   { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
   { key = 'f', mods = 'CTRL', action = act.Search({ CaseInSensitiveString = '' }) },

   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't', mods = 'CTRL', action = act.SpawnTab('DefaultDomain') },
   { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[', mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
   { key = ']', mods = mod.SUPER, action = act.ActivateTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },

   -- panes --
   -- panes: split panes
   {
      key = [[-]],
      mods = mod.SUPER,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[\]],
      mods = mod.SUPER,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },

   -- panes: zoom+close pane
   { key = 'z', mods = mod.SUPER_REV, action = act.TogglePaneZoomState },
   { key = 'w', mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

   -- panes: navigation
   { key = 'k', mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },

   -- panes: resize
   { key = 'UpArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Up', 1 }) },
   { key = 'DownArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Down', 1 }) },
   { key = 'LeftArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Left', 1 }) },
   { key = 'RightArrow', mods = mod.SUPER_REV, action = act.AdjustPaneSize({ 'Right', 1 }) },

   -- key-tables --
   -- resize panes
   {
      key = 'p',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
}

local key_tables = {
   resize_pane = {
      { key = 'k', action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j', action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h', action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l', action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q', action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
   -- Move mouse will only select text and not copy text to clipboard
   {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Cell',
   },
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor 'Cell',
   },
   {
      event = { Drag = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.ExtendSelectionToMouseCursor 'Cell',
   },
   -- Triple Left click will select a line
   {
      event = { Down = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Line',
   },
   {
      event = { Up = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Line',
   },
   -- Double Left click will select a word
   {
      event = { Down = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Word',
   },
   {
      event = { Up = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Word',
   },
   -- Turn on the mouse wheel to scroll the screen
   {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
   },
   {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      action = act.ScrollByCurrentEventWheelDelta,
   },
}

return {
   disable_default_key_bindings = true,
   disable_default_mouse_bindings = true,
   leader = { key = 'Space', mods = 'CTRL|SHIFT' },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
