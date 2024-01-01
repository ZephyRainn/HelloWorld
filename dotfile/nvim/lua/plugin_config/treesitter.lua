vim.cmd('syntax off')

require'nvim-treesitter.configs'.setup {
    matchup = {
        enable = true
    },
    highlight = {
        enable = true
    }
}
