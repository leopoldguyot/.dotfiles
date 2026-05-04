return {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("quarto").setup({
            lspFeatures = {
                enabled = true,
                chunks = "curly",
                languages = { "r", "python", "julia", "bash", "html" },
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                completion = {
                    enabled = true,
                },
            },
            codeRunner = {
                enabled = false,
            },
        })

        vim.keymap.set("n", "<leader>qp", "<cmd>QuartoPreview<CR>", {
            silent = true,
            desc = "Quarto preview",
        })
    end,
}
