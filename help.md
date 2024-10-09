# tmux
How to have one window on a separate screen ?

If -t is given, the new session is grouped with target-session.  This means they share the same set
of windows - all windows from target-session are linked to the new session and any subsequent new
windows or windows being closed are applied to both sessions.  The current and previous window and
any session options remain independent and either session may be killed without affecting the
other.  Giving -n or shell-command are invalid if -t is used.

=> Create a script to launch a session that will have the target specified by a fzf trough the current sessions

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

- `:q` or  `<leader> + q` quit neovim

- `:w` or `<leader> + w` save changes made to the file.

- `:q!` forcefully quit without saving

- `:wq` write and quit

- :w filename     Save file under new filename

- `:<tab> `         Show commands

- i               Switch to INSERT mode
- R               Switch to REPLACE mode to overwrite text
- v               Switch to VISUAL mode
- V               Switch to VISUAL LINE mode
- <ctrl>v         Switch to VISUAL BLOCK mode
- o               Insert a new line below the current line and go to INSERT mode
- O               Insert a new line above the current line and go to INSERT mode
- x               Delete character under the cursor
- X               Delete character left of the cursor
- dd              Delete current line
- dw              Delete current word
- D               Delete to the end of the line
- <esc>           Leave current mode
- /               Search for text
- $               Go to the end of the line
- gcc             Comment out a line
- <ctrl>r         Redo last change
- <ctrl>g         Show file info

- /               Search forward
- ?               Search backward
- n               Repeat last search
- s{char}{char}   Sneak search forward
- s<enter>        Repeat last sneak search
- f{char}         Jump to the next {char} right
- fffff           Jump to next found
?close little buffer (for instance for definition) => :q

0               To first character in the line
$               To end of line
G               To end of file
gg              To start of file
w               Word forward
b               Word backwards
)               Sentence forward
(               Sentence backwards
}               Paragraph forward
{               Paragraph backwards

:sf filename            Open file in new window
:sf <tab>               Search file 


## Copy/paste

- For wayland install wl-clipboard and use export `NVIM_WAYLAND_CLIPBOARD_PROVIDER="wl-clipboard"`
- You can communicate with the wl-clipboard with `"+` and y or p

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
    - There are builtin tools: proselint, spell, actionlint, checkmake, clazy, cmake_lint, format_r, styler (note that a formater is already present in the base lsp)