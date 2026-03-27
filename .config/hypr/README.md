# Hyprland Keybinds

This file is generated from `hyprland.conf`, grouped by purpose.
Regenerate with `~/.local/bin/scripts/update-hypr-keybinds-readme`.

## Variables

- `$mainMod` = `SUPER`
- `$terminal` = `foot`
- `$menu` = `wofi --show drun`

## Keyboard layout

_Note: workspace and close-window binds are loaded from the active layout source file._

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + F1` | `exec` | `~/.local/bin/scripts/keyboard-layout-switcher` | `regular` | `Run \`~/.local/bin/scripts/keyboard-layout-switcher\`` |

## Session & launchers

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + Return` | `exec` | `foot` | `regular` | `Open terminal` |
| `SUPER + O` | `exit` | `-` | `regular` | `Exit Hyprland session` |
| `SUPER + space` | `exec` | `wofi --show drun` | `regular` | `Open application launcher` |
| `SUPER + CTRL + L` | `exec` | `hyprlock` | `regular` | `Lock screen` |
| `SUPER + W` | `exec` | `~/.local/bin/scripts/wallpaper-picker` | `regular` | `Open wallpaper picker script` |

## Window management

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + F` | `fullscreen` | `-` | `regular` | `Toggle fullscreen for active window` |
| `SUPER + V` | `togglefloating` | `-` | `regular` | `Toggle floating mode for active window` |
| `SUPER + P` | `pseudo` | `-` | `regular` | `Toggle pseudotile for active window` |
| `SUPER + T` | `togglesplit` | `-` | `regular` | `Toggle split orientation in dwindle layout` |
| `SUPER + SHIFT + code:24` | `killactive` | `-` | `regular` | `Close active window` |
| `SUPER + left` | `movefocus` | `l` | `regular` | `Move focus left` |
| `SUPER + right` | `movefocus` | `r` | `regular` | `Move focus right` |
| `SUPER + up` | `movefocus` | `u` | `regular` | `Move focus up` |
| `SUPER + down` | `movefocus` | `d` | `regular` | `Move focus down` |
| `SUPER + SHIFT + left` | `movewindow` | `l` | `regular` | `Move active window left` |
| `SUPER + SHIFT + right` | `movewindow` | `r` | `regular` | `Move active window right` |
| `SUPER + SHIFT + up` | `movewindow` | `u` | `regular` | `Move active window up` |
| `SUPER + SHIFT + down` | `movewindow` | `d` | `regular` | `Move active window down` |
| `SUPER + H` | `movefocus` | `l` | `regular` | `Move focus left` |
| `SUPER + J` | `movefocus` | `d` | `regular` | `Move focus down` |
| `SUPER + K` | `movefocus` | `u` | `regular` | `Move focus up` |
| `SUPER + L` | `movefocus` | `r` | `regular` | `Move focus right` |
| `SUPER + SHIFT + H` | `movewindow` | `l` | `regular` | `Move active window left` |
| `SUPER + SHIFT + J` | `movewindow` | `d` | `regular` | `Move active window down` |
| `SUPER + SHIFT + K` | `movewindow` | `u` | `regular` | `Move active window up` |
| `SUPER + SHIFT + L` | `movewindow` | `r` | `regular` | `Move active window right` |
| `SUPER + mouse:272` | `movewindow` | `-` | `mouse` | `Move active window with mouse drag` |
| `SUPER + mouse:273` | `resizewindow` | `-` | `mouse` | `Resize active window with mouse drag` |

## Workspaces

_Note: workspace keys use French keysyms (`ampersand`, `eacute`, etc.)._

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + code:10` | `workspace` | `1` | `regular` | `Switch to workspace 1` |
| `SUPER + code:11` | `workspace` | `2` | `regular` | `Switch to workspace 2` |
| `SUPER + code:12` | `workspace` | `3` | `regular` | `Switch to workspace 3` |
| `SUPER + code:13` | `workspace` | `4` | `regular` | `Switch to workspace 4` |
| `SUPER + code:14` | `workspace` | `5` | `regular` | `Switch to workspace 5` |
| `SUPER + code:15` | `workspace` | `6` | `regular` | `Switch to workspace 6` |
| `SUPER + code:16` | `workspace` | `7` | `regular` | `Switch to workspace 7` |
| `SUPER + code:17` | `workspace` | `8` | `regular` | `Switch to workspace 8` |
| `SUPER + code:18` | `workspace` | `9` | `regular` | `Switch to workspace 9` |
| `SUPER + code:19` | `workspace` | `10` | `regular` | `Switch to workspace 10` |
| `SUPER + SHIFT + code:10` | `movetoworkspace` | `1` | `regular` | `Send active window to workspace 1` |
| `SUPER + SHIFT + code:11` | `movetoworkspace` | `2` | `regular` | `Send active window to workspace 2` |
| `SUPER + SHIFT + code:12` | `movetoworkspace` | `3` | `regular` | `Send active window to workspace 3` |
| `SUPER + SHIFT + code:13` | `movetoworkspace` | `4` | `regular` | `Send active window to workspace 4` |
| `SUPER + SHIFT + code:14` | `movetoworkspace` | `5` | `regular` | `Send active window to workspace 5` |
| `SUPER + SHIFT + code:15` | `movetoworkspace` | `6` | `regular` | `Send active window to workspace 6` |
| `SUPER + SHIFT + code:16` | `movetoworkspace` | `7` | `regular` | `Send active window to workspace 7` |
| `SUPER + SHIFT + code:17` | `movetoworkspace` | `8` | `regular` | `Send active window to workspace 8` |
| `SUPER + SHIFT + code:18` | `movetoworkspace` | `9` | `regular` | `Send active window to workspace 9` |
| `SUPER + SHIFT + code:19` | `movetoworkspace` | `10` | `regular` | `Send active window to workspace 10` |
| `SUPER + M` | `togglespecialworkspace` | `magic` | `regular` | `Toggle special workspace \`magic\`` |
| `SUPER + SHIFT + M` | `movetoworkspace` | `special:magic` | `regular` | `Send active window to special:magic` |
| `SUPER + mouse_down` | `workspace` | `e+1` | `regular` | `Switch to next workspace` |
| `SUPER + mouse_up` | `workspace` | `e-1` | `regular` | `Switch to previous workspace` |

## Monitors & displays

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + ALT + O` | `movewindow` | `mon:l` | `regular` | `Move active window to left monitor` |
| `SUPER + ALT + P` | `movewindow` | `mon:r` | `regular` | `Move active window to right monitor` |
| `SUPER + B` | `movecurrentworkspacetomonitor` | `l` | `regular` | `Move current workspace to left` |
| `SUPER + N` | `movecurrentworkspacetomonitor` | `r` | `regular` | `Move current workspace to right` |

## Screenshots & recording

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `SUPER + SHIFT + S` | `exec` | `hyprcap shot region -z -w -n` | `regular` | `Capture screenshot of selected region` |
| `SUPER + SHIFT + ALT + S` | `exec` | `hyprcap shot window:active -z -w -n` | `regular` | `Capture screenshot of active window` |
| `SUPER + SHIFT + CTRL + S` | `exec` | `hyprcap shot -z -w -n` | `regular` | `Capture screenshot interactively` |
| `SUPER + SHIFT + R` | `exec` | `hyprcap rec region -c -n` | `regular` | `Toggle recording for selected region` |
| `SUPER + SHIFT + ALT + R` | `exec` | `hyprcap rec window:active -w -n` | `regular` | `Toggle recording for active window` |
| `SUPER + SHIFT + CTRL + R` | `exec` | `hyprcap rec -w -n` | `regular` | `Toggle recording interactively` |

## Media, volume & brightness

| Shortcut | Dispatcher | Params | Bind flags | Comment |
| --- | --- | --- | --- | --- |
| `XF86AudioRaiseVolume` | `exec` | `wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+` | `repeat, locked` | `Increase output volume by 5%` |
| `XF86AudioLowerVolume` | `exec` | `wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-` | `repeat, locked` | `Decrease output volume by 5%` |
| `XF86AudioMute` | `exec` | `wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle` | `repeat, locked` | `Toggle output mute` |
| `XF86AudioMicMute` | `exec` | `wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle` | `repeat, locked` | `Toggle microphone mute` |
| `XF86MonBrightnessUp` | `exec` | `brightnessctl -e4 -n2 set 5%+` | `repeat, locked` | `Increase screen brightness by 5%` |
| `XF86MonBrightnessDown` | `exec` | `brightnessctl -e4 -n2 set 5%-` | `repeat, locked` | `Decrease screen brightness by 5%` |
| `XF86AudioNext` | `exec` | `playerctl next` | `locked` | `Play next media track` |
| `XF86AudioPause` | `exec` | `playerctl play-pause` | `locked` | `Toggle play/pause` |
| `XF86AudioPlay` | `exec` | `playerctl play-pause` | `locked` | `Toggle play/pause` |
| `XF86AudioPrev` | `exec` | `playerctl previous` | `locked` | `Play previous media track` |
