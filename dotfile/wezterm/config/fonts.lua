local wezterm = require('wezterm')

local font = {family = "Monaco", weight = "Regular"}
local font_size = 13

return {
   font = wezterm.font_with_fallback({font}),
   font_size = font_size,
}
