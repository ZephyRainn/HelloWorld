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

-- Move by line
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)

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

-- Search results centered
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '*', '*zz', opts)
vim.keymap.set('n', '#', '#zz', opts)
vim.keymap.set('n', 'g*', 'g*zz', opts)
vim.keymap.set('n', 'g#', 'g#zz', opts)

-- Cancel Highlight
vim.keymap.set('n', '<Leader>h', ':noh<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Indent
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Copy to Windwos
vim.keymap.set('v', 'yw', ':w !clip.exe<CR>', opts)
