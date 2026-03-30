local function clear_lualine_backgrounds()
	for _, group in ipairs(vim.fn.getcompletion("lualine", "highlight")) do
		local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		hl.bg = nil
		vim.api.nvim_set_hl(0, group, hl)
	end
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "tokyonight",
		},
		sections = {
			lualine_a = { { "mode" } },
			lualine_b = { { "branch" }, { "diff" }, { "diagnostics" } },
			lualine_c = { { "filename" } },
			lualine_x = { { "encoding" }, { "fileformat" }, { "filetype" } },
			lualine_y = { { "progress" } },
			lualine_z = { { "location" } },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename" } },
			lualine_x = { { "location" } },
			lualine_y = {},
			lualine_z = {},
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		clear_lualine_backgrounds()
	end,
}
