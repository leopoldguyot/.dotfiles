return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        scope = {
            enabled = false,
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")
        local current_indent_hl = "IblCurrentIndent"

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, current_indent_hl, { fg = "#7aa2f7", nocombine = true })
        end)

        local cache = {}

        local function shiftwidth(bufnr)
            local width = vim.api.nvim_get_option_value("shiftwidth", { buf = bufnr })
            if width == 0 then
                width = vim.api.nvim_get_option_value("tabstop", { buf = bufnr })
            end
            return width
        end

        local function is_blank(bufnr, lnum)
            local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
            return not line or line:match("^%s*$") ~= nil
        end

        local function indent(lnum)
            return vim.fn.indent(lnum)
        end

        local function current_block(tick, bufnr)
            local cached = cache[bufnr]
            if cached and cached.tick == tick then
                return cached
            end

            if bufnr ~= vim.api.nvim_get_current_buf() then
                cache[bufnr] = { tick = tick }
                return cache[bufnr]
            end

            local cursor_lnum = vim.api.nvim_win_get_cursor(0)[1]
            local cursor_indent = indent(cursor_lnum)
            if cursor_indent == 0 then
                cache[bufnr] = { tick = tick }
                return cache[bufnr]
            end

            local first = cursor_lnum
            while first > 1 do
                local previous = first - 1
                if not is_blank(bufnr, previous) and indent(previous) < cursor_indent then
                    break
                end
                first = previous
            end

            local last = cursor_lnum
            local line_count = vim.api.nvim_buf_line_count(bufnr)
            while last < line_count do
                local next = last + 1
                if not is_blank(bufnr, next) and indent(next) < cursor_indent then
                    break
                end
                last = next
            end

            cache[bufnr] = {
                tick = tick,
                first = first - 1,
                last = last - 1,
                guide_col = math.max(cursor_indent - shiftwidth(bufnr), 0),
            }
            return cache[bufnr]
        end

        hooks.register(hooks.type.VIRTUAL_TEXT, function(tick, bufnr, row, virt_text)
            local block = current_block(tick, bufnr)
            if not block.first or row < block.first or row > block.last then
                return virt_text
            end

            local chunk = virt_text[block.guide_col + 1]
            if not chunk or chunk[1] == " " then
                return virt_text
            end

            if type(chunk[2]) == "table" then
                table.insert(chunk[2], current_indent_hl)
            elseif chunk[2] then
                chunk[2] = { chunk[2], current_indent_hl }
            else
                chunk[2] = current_indent_hl
            end

            return virt_text
        end)

        require("ibl").setup(opts)
    end,
}
