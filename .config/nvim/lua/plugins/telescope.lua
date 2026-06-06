return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "jonarrien/telescope-cmdline.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
                cmdline = {
                    picker = {
                        layout_config = {
                            width = 0.8,
                            height = 0.4,
                        },
                    },
                },
            },
            defaults = {
                file_ignore_patterns = {"^.git/", "%.git$"}, -- optional: ignore .git files/folders
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden", -- include hidden files in live_grep
                    "--glob", "!**/.git/*" -- exclude .git files/folders
                }
            },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({ hidden = true })
        end, {desc = "find files including hidden"})
        vim.keymap.set('n', '<leader>fg', function()
            builtin.live_grep()
        end, {desc = "grep including hidden"})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "find buffers"})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "find help"})
        vim.keymap.set("n", ":", "<cmd>Telescope cmdline<CR>", {desc = "telescope cmdline"})
        vim.keymap.set("n", "<leader>:", ":", {desc = "native cmdline"})
        telescope.load_extension("ui-select")
        telescope.load_extension("cmdline")
        telescope.load_extension("fzf")
    end,
  },
}
