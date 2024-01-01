-- General
vim.opt.mouse = 'a'
vim.opt.updatetime = 300

vim.opt.undodir = os.getenv('HOME')..'/.config/nvim/undo'
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd('filetype on')
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')

-- Format
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.autoindent = true

-- UI config
vim.opt.title = true
vim.opt.number = true
vim.opt.scrolloff = 7
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
vim.opt.colorcolumn = '100'

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
