return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		init = function()
			vim.g.tmux_navigator_disable_when_zoomed = 1
			vim.g.tmux_navigator_save_on_switch = 2
		end,
	},
}
