local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'nu' }
   options.launch_menu = {
      { label = 'nushell', args = { 'nu' } },
      { label = 'PowerShell', args = { 'pwsh' } },
      { label = 'Git Bash', args = { 'bash' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'bash' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash' } },
      { label = 'Fish', args = { 'fish' } },
   }
end

return options
