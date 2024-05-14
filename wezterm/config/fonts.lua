local wezterm = require('wezterm')

local font = {family = "Rec Mono Casual", weight = "Regular"}
local font_cn = {family = "Maple Mono SC NF", weight = "Regular"}
local font_size = 13

return {
   font = wezterm.font_with_fallback({font, font_cn}),
   font_size = font_size,
}
