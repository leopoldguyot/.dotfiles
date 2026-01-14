return {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time. For now we recommend pinning to the latest minor version
    -- like so:
    -- version = "~0.1.0",
    config = function()
        require('r').setup({
            auto_quit = true,
        })

        -- Manual keymap for pipe operator and R code block
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "r", "rmd", "quarto" },
            callback = function()
                -- Pipe operator keymap
                vim.keymap.set('i', '<C-S-m>', ' |> ', { buffer = true, desc = "Insert pipe operator" })

                -- R code block keymap using LocalLeader (backslash by default)
                -- Note: R.nvim already has <M-r> (Alt+r) in insert mode for this
                vim.keymap.set('n', '<LocalLeader>kc', function()
                    local line = vim.api.nvim_win_get_cursor(0)[1]
                    vim.api.nvim_buf_set_lines(0, line - 1, line - 1, false, {
                        '```{r}',
                        '',
                        '```'
                    })
                    vim.api.nvim_win_set_cursor(0, {line + 1, 0})
                    vim.cmd('startinsert!')
                end, { buffer = true, desc = "Insert R code block" })
            end,
        })
    end
}

