return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "r_language_server", "texlab" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for _, server in ipairs({ "lua_ls", "r_language_server", "texlab" }) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "get definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "get reference" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
        end,
    },
}
