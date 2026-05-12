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

        local function r_string(value)
            return vim.fn.json_encode(value)
        end

        local function send_r_command(command)
            require('r.send').cmd(command)
        end

        local function package_root()
            local file = vim.api.nvim_buf_get_name(0)
            return vim.fs.root(file ~= "" and file or vim.fn.getcwd(), "DESCRIPTION") or vim.fn.getcwd()
        end

        local function with_styler(expr)
            return string.format([=[
if (requireNamespace("styler", quietly = TRUE) && requireNamespace("biocthis", quietly = TRUE)) {
  %s
} else {
  cat("\nInstall required packages with: install.packages(c('styler', 'biocthis'))\n\n")
}
]=], expr)
        end

        local function with_devtools(expr)
            return string.format([=[
if (requireNamespace("devtools", quietly = TRUE)) {
  %s
} else {
  cat("\nInstall devtools with: install.packages('devtools')\n\n")
}
]=], expr)
        end

        local function style_file()
            local file = vim.fn.expand("%:p")
            if file == "" then
                vim.notify("No current file to style", vim.log.levels.WARN, { title = "R.nvim" })
                return
            end
            if vim.bo.modified then
                vim.cmd.write()
            end
            send_r_command(with_styler(string.format(
                "styler::style_file(%s, transformers = biocthis::bioc_style(indent_by = 4L))",
                r_string(file)
            )))
        end

        local function style_dir()
            send_r_command(with_styler(string.format(
                "styler::style_dir(%s, recursive = TRUE, transformers = biocthis::bioc_style(indent_by = 4L))",
                r_string(vim.fn.getcwd())
            )))
        end

        local function style_pkg()
            send_r_command(with_styler(string.format(
                "styler::style_pkg(%s, transformers = biocthis::bioc_style(indent_by = 4L))",
                r_string(package_root())
            )))
        end

        local function devtools_cmd(expr)
            send_r_command(with_devtools(expr))
        end

        local function start_httpgd()
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

            if vim.env.SSH_CONNECTION and vim.env.SSH_CONNECTION ~= "" then
                vim.notify(
                    string.format("Open a tunnel first: ssh -L %d:127.0.0.1:%d <host>", httpgd_port, httpgd_port),
                    vim.log.levels.INFO,
                    { title = "R.nvim httpgd" }
                )
            end

            require('r.send').cmd(string.format([=[
if (requireNamespace("httpgd", quietly = TRUE)) {
  devs <- grDevices::dev.list()
  if (is.null(devs) || !any(names(devs) == "httpgd")) {
    httpgd::hgd(host = "127.0.0.1", port = %d, token = FALSE, silent = TRUE)
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
        })

        -- Manual keymaps for common R operators and code block
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "r", "rmd", "quarto" },
            callback = function()
                local function insert_r_chunk()
                    local line = vim.api.nvim_win_get_cursor(0)[1]
                    vim.api.nvim_buf_set_lines(0, line - 1, line - 1, false, {
                        '```{r}',
                        '',
                        '```'
                    })
                    vim.api.nvim_win_set_cursor(0, {line + 1, 0})
                    vim.cmd('startinsert!')
                end

                -- Pipe operator keymaps
                vim.keymap.set('i', '<C-S-m>', ' |> ', { buffer = true, desc = "Insert pipe operator" })
                vim.keymap.set('i', '<M-p>', ' |> ', { buffer = true, desc = "Insert pipe operator" })

                -- Assignment operator keymap
                vim.keymap.set('i', '<M-->', ' <- ', { buffer = true, desc = "Insert assignment operator" })

                -- R code block keymap using LocalLeader (backslash by default)
                -- Note: R.nvim already has <M-r> (Alt+r) in insert mode for this
                vim.keymap.set('n', '<LocalLeader>kc', insert_r_chunk, { buffer = true, desc = "Insert R code block" })
                vim.keymap.set('n', '<LocalLeader>hg', start_httpgd, { buffer = true, desc = "Start httpgd" })
                vim.keymap.set('n', '<LocalLeader>sf', style_file, { buffer = true, desc = "Style current file" })
                vim.keymap.set('n', '<LocalLeader>sd', style_dir, { buffer = true, desc = "Style current directory" })
                vim.keymap.set('n', '<LocalLeader>sp', style_pkg, { buffer = true, desc = "Style package" })
                vim.keymap.set('n', '<LocalLeader>pl', function()
                    devtools_cmd(string.format("devtools::load_all(path = %s)", r_string(package_root())))
                end, { buffer = true, desc = "Load package" })
                vim.keymap.set('n', '<LocalLeader>pi', function()
                    devtools_cmd(string.format("devtools::install(pkg = %s, upgrade = 'never')", r_string(package_root())))
                end, { buffer = true, desc = "Install package" })
                vim.keymap.set('n', '<LocalLeader>pI', function()
                    devtools_cmd(string.format(
                        "devtools::install_deps(pkg = %s, dependencies = TRUE, upgrade = 'never')",
                        r_string(package_root())
                    ))
                end, { buffer = true, desc = "Install package dependencies" })
                vim.keymap.set('n', '<LocalLeader>pt', function()
                    devtools_cmd(string.format("devtools::test(pkg = %s)", r_string(package_root())))
                end, { buffer = true, desc = "Test package" })
                vim.keymap.set('n', '<LocalLeader>pc', function()
                    devtools_cmd(string.format("devtools::check(pkg = %s)", r_string(package_root())))
                end, { buffer = true, desc = "Check package" })
                vim.keymap.set('n', '<LocalLeader>pd', function()
                    devtools_cmd(string.format("devtools::document(pkg = %s)", r_string(package_root())))
                end, { buffer = true, desc = "Document package" })
                vim.keymap.set('n', '<LocalLeader>pb', function()
                    devtools_cmd(string.format("devtools::build(pkg = %s)", r_string(package_root())))
                end, { buffer = true, desc = "Build package" })

                if vim.bo.filetype == "rmd" or vim.bo.filetype == "quarto" then
                    vim.keymap.set({ 'n', 'i' }, '<M-c>', insert_r_chunk, { buffer = true, desc = "Insert Rmd chunk" })
                end
            end,
        })
    end
}
