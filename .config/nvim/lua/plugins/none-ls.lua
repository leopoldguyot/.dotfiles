return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local sources = {}

		-- Change this transformer expression if you want a different R formatter profile.
		local r_transformers = "biocthis::bioc_style(indent_by = 4)"
		local r_styler = formatting.styler.with({
			extra_filetypes = { "quarto" },
			args = function(params)
				local ext = params.ft == "quarto" and "qmd" or params.ft
				local default_args = {
					"--slave",
					"--no-restore",
					"--no-save",
					"-e",
				}

				if params.ft == "r" then
					return vim.list_extend(default_args, {
						string.format(
							[[con <- file("stdin")
output <- styler::style_text(readLines(con), transformers = %s)
close(con)
print(output, colored = FALSE)]],
							r_transformers
						),
					})
				end

				return vim.list_extend(default_args, {
					string.format(
						[[options(styler.quiet = TRUE)
con <- file("stdin")
temp <- tempfile("styler", fileext = ".%s")
writeLines(readLines(con), temp)
styler::style_file(temp, transformers = %s)
cat(paste0(readLines(temp), collapse = '\n'))
close(con)]],
						ext,
						r_transformers
					),
				})
			end,
		})

		if vim.fn.executable("stylua") == 1 then
			table.insert(sources, formatting.stylua)
		end
		table.insert(sources, r_styler)

		null_ls.setup({
			sources = sources,
		})

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ timeout_ms = 3000 })
		end, { desc = "format buffer" })
	end,
}
