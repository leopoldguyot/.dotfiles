return {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time. For now we recommend pinning to the latest minor version
    -- like so:
    -- version = "~0.1.0",
    config = function()
        local httpgd_port = tonumber(vim.env.R_HTTPGD_PORT) or 7878

        local function start_httpgd_on_ssh()
            if not vim.env.SSH_CONNECTION or vim.env.SSH_CONNECTION == "" then
                return
            end

            local function copy_to_system_clipboard(text)
                local ok = pcall(vim.fn.setreg, '+', text)
                if ok then
                    return true
                end

                if vim.fn.executable('wl-copy') == 1 then
                    vim.system({ 'wl-copy' }, { stdin = text })
                    return true
                end
                if vim.fn.executable('xclip') == 1 then
                    vim.system({ 'xclip', '-selection', 'clipboard' }, { stdin = text })
                    return true
                end
                if vim.fn.executable('xsel') == 1 then
                    vim.system({ 'xsel', '--clipboard', '--input' }, { stdin = text })
                    return true
                end
                return false
            end

            local url = string.format("http://127.0.0.1:%d", httpgd_port)
            if copy_to_system_clipboard(url) then
                vim.notify("Copied httpgd URL to system clipboard: " .. url, vim.log.levels.INFO, { title = "R.nvim" })
            else
                vim.notify("Could not copy httpgd URL to system clipboard", vim.log.levels.WARN, { title = "R.nvim" })
            end

            require('r.send').cmd(string.format([=[
if (requireNamespace("httpgd", quietly = TRUE)) {
  devs <- grDevices::dev.list()
  if (is.null(devs) || !any(names(devs) == "httpgd")) {
    httpgd::hgd(host = "127.0.0.1", port = %d, token = TRUE, silent = TRUE)
  }
  url <- httpgd::hgd_url(host = "127.0.0.1", port = %d)
  cat("\nhttpgd URL: ", url, "\n\n", sep = "")
} else {
  cat("\nInstall httpgd once with: install.packages('httpgd')\n\n")
}
]=], httpgd_port, httpgd_port))
        end

        require('r').setup({
            auto_quit = true,
            register_treesitter = false,
            hook = {
                after_R_start = start_httpgd_on_ssh,
            },
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
