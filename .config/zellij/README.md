# zellij notes

## Goal

This setup is meant for A/B testing against tmux without breaking the current Neovim workflow.

## Key points

- `Ctrl+h/j/k/l`: move between Neovim splits and zellij panes (bridge enabled)
- `Alt+h/j/k/l`: move between zellij panes from non-Neovim panes
- `Alt+v`: split right
- `Alt+s`: split down
- `Alt+c`: new tab
- `Alt+y`: toggle synchronized tab input
- `Alt+f`: open `sessionizer` picker (floating, switches session)
- `Alt+Shift+f`: toggle floating panes

## Bridge with Neovim

Neovim is configured to route `<C-h/j/k/l>` automatically:

- inside zellij: uses `zellij-nav.nvim`
- inside tmux: uses `vim-tmux-navigator`
- outside a multiplexer: falls back to plain `wincmd`

So one shortcut family works everywhere.

`Ctrl+h` had a default Zellij conflict (mode switch), so it is explicitly unbound in this config.

## Start / test

```bash
zellij -s trial
```

Inside zellij, open Neovim and test movement with `<C-h/j/k/l>` across splits and pane edges.

## sessionizer

`sessionizer` is the zellij equivalent of `tmux-sess`.

- Run `sessionizer` to pick a project with `fzf`
- Or run `sessionizer /path/to/project`
- Session name is derived from directory name
- If session does not exist, it creates it and applies a minimal layout:
  - left pane ~70%
  - right pane ~30%
  - both panes start in the selected project directory
