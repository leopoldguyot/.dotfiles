return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		-- Change this transformer expression if you want a different R formatter profile.
		local r_transformers = "biocthis::bioc_style(indent_by = 4)"
		local r_styler = formatting.styler.with({
			extra_filetypes = { "quarto" },
			args = function(params)
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
						params.ft,
						r_transformers
					),
				})
			end,
		})

		local format_on_save_enabled = true
		local format_on_save_timeout_ms = 3000
		local format_on_save_filetypes = {
			lua = true,
			r = true,
			rmd = true,
			quarto = true,
			tex = true,
		}

		null_ls.setup({
			sources = {
				formatting.stylua,
				r_styler,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
			callback = function(args)
				if not format_on_save_enabled then
					return
				end

				local bufnr = args.buf
				local ft = vim.bo[bufnr].filetype
				if not format_on_save_filetypes[ft] then
					return
				end

				vim.lsp.buf.format({
					bufnr = bufnr,
					timeout_ms = format_on_save_timeout_ms,
				})
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {desc = "format buffer"})
	end,
}
