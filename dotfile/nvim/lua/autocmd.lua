vim.api.nvim_create_autocmd({'FocusGained','BufEnter','BufWinEnter'}, {
    pattern = "*",
    command = "checktime"
})

vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        if vim.fn.line([['"]]) > 0 and vim.fn.line([['"]]) <= vim.fn.line('$') then
            vim.fn.setpos(".", vim.fn.getpos([['"]]))
            vim.cmd('silent! foldopen')
        end
    end,
})
