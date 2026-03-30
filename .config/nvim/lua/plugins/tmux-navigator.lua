local function navigate(tmux_cmd, zellij_cmd, fallback_wincmd)
	return function()
		if vim.env.ZELLIJ and vim.fn.exists(":" .. zellij_cmd) == 2 then
			vim.cmd(zellij_cmd)
			return
		end

		if vim.fn.exists(":" .. tmux_cmd) == 2 then
			vim.cmd(tmux_cmd)
			return
		end

		vim.cmd("wincmd " .. fallback_wincmd)
	end
end

return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
			vim.g.tmux_navigator_disable_when_zoomed = 1
			vim.g.tmux_navigator_save_on_switch = 2
		end,
		keys = {
			{ "<C-h>", navigate("TmuxNavigateLeft", "ZellijNavigateLeft", "h"), mode = { "n", "t" }, desc = "Pane left" },
			{ "<C-j>", navigate("TmuxNavigateDown", "ZellijNavigateDown", "j"), mode = { "n", "t" }, desc = "Pane down" },
			{ "<C-k>", navigate("TmuxNavigateUp", "ZellijNavigateUp", "k"), mode = { "n", "t" }, desc = "Pane up" },
			{ "<C-l>", navigate("TmuxNavigateRight", "ZellijNavigateRight", "l"), mode = { "n", "t" }, desc = "Pane right" },
		},
	},
	{
		"dev-vinicius-andrade/zellij-nav.nvim",
		lazy = false,
		opts = {},
	},
}
