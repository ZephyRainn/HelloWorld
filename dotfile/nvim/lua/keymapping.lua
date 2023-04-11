-- Leader Key
vim.g.mapleader = '`'

-- define common options
local opts = {
    noremap = true,
    silent = true
}

-----------------
-- Normal mode --
-----------------

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
-- Resize Window
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Cancel Highlight
vim.keymap.set('n', '<Leader>h', ':noh<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Indent
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Copy to Windwos
vim.keymap.set('v', 'yw', ':w! clip.exe<CR>', opts)
