vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.smartindent = true

vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.opt.nu = true
vim.opt.colorcolumn = "80"

local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = false,
        underline = false,
    })
end
local function show_diagnostics()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end
vim.keymap.set("n", "<leader>dh", hide_diagnostics, {desc = "hide diagnostics"})
vim.keymap.set("n", "<leader>ds", show_diagnostics, {desc = "show diagnostics"})

-- tmux pane navigation interoperability
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Window right" })
