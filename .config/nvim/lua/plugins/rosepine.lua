return {
	{
		"rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "main"
        },
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
