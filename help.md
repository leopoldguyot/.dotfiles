# tmux

- `list-keys` show bindings
- `<leader> + :` command mode

## Session
- `tmux`, `tmux new`, `tmux new-session ` start a new session
    - `-s` to name the session
    - `-A` to attach or create the session named ...
    - `new` can be called from tmux

- `kill-session` or `kill-ses` kill the current session
    - `-t` specify the session name to kill
    - `-a` kill all other session than the current (we can also specify the session name with `-t`)

- `ls` list current session
- `a` attach to last session
    - `-t` specify name

- `<leader> + b` rename the session
- `<leader> + d` detach from the session
- `<leader> + s` list current session
- `<leader> + w` preview windows and sessions
- `<leader> + (` move to previous session
- `<leader> + )` move to next session

## Windows

- `new -s mysession -n mywindow` start a new session with the name mysession and window mywindow

- `<leader> + c` Create window
- `<leader> + ,` Rename current window
- `<leader> + &` Close current window
- `<leader> + w` List windows
- `<leader> + p` Previous window
- `<leader> + n` Next window
- `<leader> + 0...9` Switch/select window by number

Possibility to move the windows

## Panes

- `<leader> + ;` last active pane
- `<leader> + "` split horizontally
- `<leader> + %` split vertically
- `<leader> + {` move current to left
- `<leader> + }` move current to right
- `<leader> + arrows` move to the direction
- `<leader> + o` move to next pane
- `<leader> + q` show pane numbers
- `<leader> + !` convert pane to window
- `<leader> + CTRL + arrows` resize pane
- `<leader> + x` close current

# neovim

To quit Neovim, use :q or <leader> + q .

Use :w or <leader> + w to save changes made to the file.

To discard changes, use :q! (It forcefully quit without saving).

To save and quit, use :wq.

?close little buffer (for instance for definition)

## lsp

- 

# fzf

- `CTRL-t` 	Look for files and directories
- `CTRL-r` 	Look through command history
- `Enter` 	Select the item
- `Ctrl-j` or `Ctrl-n` or `Down arrow` 	Go down one result
- `Ctrl-k` or `Ctrl-p` or `Up arrow `	Go up one result
- `Tab` 	Mark a result
- `Shift-Tab` 	Unmark a result
- `cd **Tab` 	Open up fzf to find directory
- `any command (like nvim or code) + **Tab` 	Look for files & directories to complete command

# Misc

- `tmux-sess` create a new tmux sess in the wanted directory

# neovim config

We have the vim-options.lua in which we specify global modification like changing a keybind.
We have the plugins folder that contain individual file for each plugin. These file need to return a table.

## Plugins:

- Mason: is use to manage the install of lsp, linter, etc
- mason-lsp-config: link the installed lsp from Mason with lsp-config (ensure_installed is the list of lsp that will be installed without the need to go in the Mason UI)
- lsp-config: manage the comunication between lsp and neovim. Each installed lsp need to be setup in the configuration of lsp-config
- none-ls: null-ls clone, manage linters and formatters.
    - There are builtin tools: proselint, spell, actionlint, checkmake, clazy, cmake_lint, format_r, styler