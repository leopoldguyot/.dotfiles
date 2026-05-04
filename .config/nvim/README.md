# Neovim shortcuts

Leader is `<Space>`.  
Local leader is `\` (default).

## Main mappings

| Mode | Keys | What it does |
| --- | --- | --- |
| Normal / Visual | `<leader>pv` | Open Yazi at the current file |
| Normal | `<leader>cw` | Open Yazi in current working directory |
| Normal | `<C-Up>` | Reopen/toggle last Yazi session |
| Normal | `<leader>gg` | Open LazyGit |
| Normal | `<leader>ff` | Telescope file search (includes hidden files) |
| Normal | `<leader>fg` | Telescope live grep |
| Normal | `<leader>fb` | Telescope buffers |
| Normal | `<leader>fh` | Telescope help tags |
| Normal | `K` | LSP hover |
| Normal | `<leader>gd` | Go to definition |
| Normal | `<leader>gr` | Find references |
| Normal | `<leader>ca` | Code actions |
| Normal | `<leader>gf` | Format current buffer |
| Normal | `<leader>qp` | Open Quarto preview |
| Normal | `<leader>dh` | Hide diagnostics |
| Normal | `<leader>ds` | Show diagnostics |
| Normal | `<leader>/` | Toggle current line comment |
| Visual | `<leader>/` | Toggle comments for selection |
| Insert | `<C-b>` / `<C-f>` | Completion docs up/down |
| Insert | `<C-Space>` | Trigger completion |
| Insert | `<C-e>` | Abort completion |
| Insert | `<Tab>` / `<CR>` | Confirm completion |
| Insert (R/Rmd/Quarto) | `<C-S-m>` / `<M-p>` | Insert `|>` |
| Insert (R/Rmd/Quarto) | `<M-->` | Insert `<-` |
| Normal (R/Rmd/Quarto) | `<LocalLeader>kc` | Insert fenced R chunk |
| Normal / Insert (Rmd/Quarto) | `<M-c>` | Insert fenced R chunk |
| Normal / Terminal | `<C-h/j/k/l>` | Move across Neovim splits and tmux/zellij panes |

## Notes

- `lazygit` binary must be installed for `<leader>gg`.
- `quarto` CLI must be installed for `<leader>qp` preview.
- Formatting is manual via `<leader>gf` (format on save is disabled).
- R mappings are only active in `r`, `rmd`, and `quarto` filetypes.
