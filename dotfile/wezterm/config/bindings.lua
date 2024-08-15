local wezterm = require('wezterm')
local act = wezterm.action

local mod = {}

local keys = {
   -- misc/useful --
   { key = 'f', mods = 'CTRL', action = act.Search({ CaseInSensitiveString = '' }) },

   -- copy/paste --
   { key = 'c', mods = 'SUPER', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'SUPER', action = act.PasteFrom('Clipboard') },

   -- tabs --
   -- tabs: spawn+close
   { key = 't', mods = 'SUPER', action = act.SpawnTab('DefaultDomain') },
   { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab({ confirm = false }) },

   -- tabs: navigation
   { key = '[', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
   { key = ']', mods = 'SUPER', action = act.ActivateTabRelative(1) },

   -- window --
   -- spawn windows
   { key = 'n', mods = 'SUPER', action = act.SpawnWindow },

   -- panes --
   -- panes: split panes
   {
      key = [[-]],
      mods = 'ALT',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[\]],
      mods = 'ALT',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },
   { key = 'w', mods = 'ALT', action = act.CloseCurrentPane({ confirm = false }) },

   { key = 'z', mods = 'ALT', action = act.TogglePaneZoomState },

   -- panes: navigation
   { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection('Right') },

   -- panes: resize
   { key = 'UpArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Up', 2 }) },
   { key = 'DownArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Down', 2 }) },
   { key = 'LeftArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Left', 2 }) },
   { key = 'RightArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Right', 2 }) },

}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'SUPER',
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
      event = { Up = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor 'Line',
   },
   -- Double Left click will select a word
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
   keys = keys,
   mouse_bindings = mouse_bindings,
}
