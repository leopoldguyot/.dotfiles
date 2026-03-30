return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				cache = false,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_colors = function(colors)
					colors.bg = "#000000"
					colors.bg_dark = "#000000"
					colors.bg_sidebar = "#000000"
					colors.bg_float = "#000000"
				end,
				on_highlights = function(hl)
					local transparent_groups = {
						"Normal",
						"NormalNC",
						"NormalFloat",
						"FloatBorder",
						"SignColumn",
						"StatusLine",
						"StatusLineNC",
						"WinSeparator",
						"VertSplit",
					}

					for _, group in ipairs(transparent_groups) do
						hl[group] = hl[group] or {}
						hl[group].bg = "NONE"
					end
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
