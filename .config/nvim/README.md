# Neovim Keybinds

Leader key: `<Space>`  
LocalLeader key: `\` (default)

## Important shortcuts

| Mode | Shortcut | Action | Source |
| --- | --- | --- | --- |
| Normal / Visual | `<leader>pv` | Open Yazi at current file | `yazi.nvim` |
| Normal | `<leader>cw` | Open Yazi in current working directory | `yazi.nvim` |
| Normal | `<C-Up>` | Resume / toggle last Yazi session | `yazi.nvim` |
| Normal | `<leader>gg` | Open LazyGit | `lazygit.nvim` |
| Normal | `<leader>ff` | Find files (includes hidden) | `telescope.nvim` |
| Normal | `<leader>fg` | Live grep (includes hidden) | `telescope.nvim` |
| Normal | `<leader>fb` | Find open buffers | `telescope.nvim` |
| Normal | `<leader>fh` | Find help tags | `telescope.nvim` |
| Normal | `K` | LSP hover documentation | `nvim-lspconfig` |
| Normal | `<leader>gd` | Go to definition | `nvim-lspconfig` |
| Normal | `<leader>gr` | List references | `nvim-lspconfig` |
| Normal | `<leader>ca` | Code action | `nvim-lspconfig` |
| Normal | `<leader>gf` | Format current buffer | `none-ls` |
| Normal | `<leader>dh` | Hide diagnostics (virtual text/signs/underline) | `vim-options.lua` |
| Normal | `<leader>ds` | Show diagnostics | `vim-options.lua` |
| Normal | `<C-h>` | Move to left split | `vim-options.lua` |
| Normal | `<C-j>` | Move to split below | `vim-options.lua` |
| Normal | `<C-k>` | Move to split above | `vim-options.lua` |
| Normal | `<C-l>` | Move to right split | `vim-options.lua` |
| Normal | `<leader>/` | Toggle line comment (remaps to `gcc`) | `Comment.nvim` |
| Visual | `<leader>/` | Toggle comment for selection (remaps to `gc`) | `Comment.nvim` |
| Insert | `<C-b>` | Completion docs scroll up | `nvim-cmp` |
| Insert | `<C-f>` | Completion docs scroll down | `nvim-cmp` |
| Insert | `<C-Space>` | Trigger completion menu | `nvim-cmp` |
| Insert | `<C-e>` | Abort completion | `nvim-cmp` |
| Insert | `<Tab>` | Confirm selected completion item | `nvim-cmp` |
| Insert | `<CR>` | Confirm selected completion item | `nvim-cmp` |
| Insert (R/Rmd/Quarto) | `<C-S-m>` | Insert pipe operator `|>` | `R.nvim` |
| Normal (R/Rmd/Quarto) | `<LocalLeader>kc` | Insert fenced R code block | `R.nvim` |

## Notes

- `<leader>gg` requires the `lazygit` binary to be installed on the system.
- R-specific mappings are available only in `r`, `rmd`, and `quarto` buffers.
