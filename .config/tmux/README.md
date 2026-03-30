# tmux configuration

This setup is designed to work well on **FR / BE / ENG** keyboards by favoring
letter- and Ctrl-based bindings over symbol-heavy defaults.

## Prefix

- Primary prefix: `Ctrl+a`
- Secondary prefix: `Ctrl+b` (kept as fallback)

## Important keybinds

| Context | Shortcut | Action |
| --- | --- | --- |
| Prefix | `r` | Reload `~/.config/tmux/tmux.conf` |
| Prefix | `c` | New window in current pane path |
| Prefix | `v` | Split pane left/right |
| Prefix | `s` | Split pane top/bottom |
| Prefix | `f` | Launch `~/.local/bin/scripts/tmux-sess` |
| Prefix | `h/j/k/l` | Move between panes |
| Prefix | `H/J/K/L` | Resize pane (`-r`, repeatable) |
| Prefix | `y` | Toggle synchronized panes |
| Global (no prefix) | `Ctrl+h/j/k/l` | Move across tmux panes (or forward to Neovim split nav) |
| Global (no prefix) | `Ctrl+\` | Jump to last pane (or forward to Neovim) |

## Copy mode (vi)

| Context | Shortcut | Action |
| --- | --- | --- |
| Copy mode | `v` | Begin selection |
| Copy mode | `y` | Copy selection and exit |

## Neovim workflow

tmux detects Neovim-like processes and forwards `Ctrl+h/j/k/l` + `Ctrl+\` to
Neovim when appropriate, otherwise it switches tmux panes. This gives a unified
navigation flow between Neovim splits and tmux panes.

## Plugins

- `rose-pine/tmux`
- `tmux-plugins/tpm`

TPM is loaded from either path (for compatibility):

- `~/.config/tmux/plugins/tpm/tpm`
- `~/.config/tmux/tpm/tpm`

## Dependencies

- `tmux`
- `fzf` (used by `tmux-sess`)
