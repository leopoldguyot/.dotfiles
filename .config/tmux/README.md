# tmux notes

## Prefix

- Main prefix: `Ctrl+a`
- Fallback prefix: `Ctrl+b`

This avoids awkward symbol keys and is easier to keep consistent across FR/BE/ENG layouts.

## Day-to-day keys

| Keys | Action |
| --- | --- |
| `prefix + r` | Reload tmux config |
| `prefix + c` | New window in current path |
| `prefix + v` | Split left/right |
| `prefix + s` | Split top/bottom |
| `prefix + f` | Open `tmux-sess` picker |
| `prefix + h/j/k/l` | Move between panes |
| `prefix + H/J/K/L` | Resize pane |
| `prefix + y` | Toggle synchronized panes |
| `Ctrl+h/j/k/l` | Move across tmux + Neovim panes |

## Copy mode

| Keys | Action |
| --- | --- |
| `v` | Start selection |
| `y` | Copy and leave copy mode |

## Plugins

- `rose-pine/tmux`
- `tmux-plugins/tpm`
- `christoomey/vim-tmux-navigator`

TPM is checked in both locations:

- `~/.config/tmux/plugins/tpm/tpm`
- `~/.config/tmux/tpm/tpm`

## Requirements

- `tmux`
- `fzf` (for `tmux-sess`)
