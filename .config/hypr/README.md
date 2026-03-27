# Hyprland Keybinds

This file is generated from `hyprland.conf`, grouped by purpose.

## Variables

- `$mainMod` = `SUPER`
- `$terminal` = `foot`
- `$menu` = `wofi --show drun`

## Session & launchers

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `SUPER + Return` | `exec` | `foot` | `regular` |
| `SUPER + O` | `exit` | `-` | `regular` |
| `SUPER + space` | `exec` | `wofi --show drun` | `regular` |
| `SUPER + CTRL + L` | `exec` | `hyprlock` | `regular` |
| `SUPER + W` | `exec` | `~/.local/bin/scripts/wallpaper-picker` | `regular` |

## Window management

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `SUPER + SHIFT + A` | `killactive` | `-` | `regular` |
| `SUPER + F` | `fullscreen` | `-` | `regular` |
| `SUPER + V` | `togglefloating` | `-` | `regular` |
| `SUPER + P` | `pseudo` | `-` | `regular` |
| `SUPER + T` | `togglesplit` | `-` | `regular` |
| `SUPER + left` | `movefocus` | `l` | `regular` |
| `SUPER + right` | `movefocus` | `r` | `regular` |
| `SUPER + up` | `movefocus` | `u` | `regular` |
| `SUPER + down` | `movefocus` | `d` | `regular` |
| `SUPER + SHIFT + left` | `movewindow` | `l` | `regular` |
| `SUPER + SHIFT + right` | `movewindow` | `r` | `regular` |
| `SUPER + SHIFT + up` | `movewindow` | `u` | `regular` |
| `SUPER + SHIFT + down` | `movewindow` | `d` | `regular` |
| `SUPER + H` | `movefocus` | `l` | `regular` |
| `SUPER + J` | `movefocus` | `d` | `regular` |
| `SUPER + K` | `movefocus` | `u` | `regular` |
| `SUPER + L` | `movefocus` | `r` | `regular` |
| `SUPER + SHIFT + H` | `movewindow` | `l` | `regular` |
| `SUPER + SHIFT + J` | `movewindow` | `d` | `regular` |
| `SUPER + SHIFT + K` | `movewindow` | `u` | `regular` |
| `SUPER + SHIFT + L` | `movewindow` | `r` | `regular` |
| `SUPER + mouse:272` | `movewindow` | `-` | `mouse` |
| `SUPER + mouse:273` | `resizewindow` | `-` | `mouse` |

## Workspaces

_Note: workspace keys use French keysyms (`ampersand`, `eacute`, etc.)._

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `SUPER + ampersand` | `workspace` | `1` | `regular` |
| `SUPER + eacute` | `workspace` | `2` | `regular` |
| `SUPER + quotedbl` | `workspace` | `3` | `regular` |
| `SUPER + apostrophe` | `workspace` | `4` | `regular` |
| `SUPER + parenleft` | `workspace` | `5` | `regular` |
| `SUPER + minus` | `workspace` | `6` | `regular` |
| `SUPER + section` | `workspace` | `6` | `regular` |
| `SUPER + egrave` | `workspace` | `7` | `regular` |
| `SUPER + underscore` | `workspace` | `8` | `regular` |
| `SUPER + ccedilla` | `workspace` | `9` | `regular` |
| `SUPER + agrave` | `workspace` | `10` | `regular` |
| `SUPER + SHIFT + ampersand` | `movetoworkspace` | `1` | `regular` |
| `SUPER + SHIFT + eacute` | `movetoworkspace` | `2` | `regular` |
| `SUPER + SHIFT + quotedbl` | `movetoworkspace` | `3` | `regular` |
| `SUPER + SHIFT + apostrophe` | `movetoworkspace` | `4` | `regular` |
| `SUPER + SHIFT + parenleft` | `movetoworkspace` | `5` | `regular` |
| `SUPER + SHIFT + minus` | `movetoworkspace` | `6` | `regular` |
| `SUPER + SHIFT + section` | `movetoworkspace` | `6` | `regular` |
| `SUPER + SHIFT + egrave` | `movetoworkspace` | `7` | `regular` |
| `SUPER + SHIFT + underscore` | `movetoworkspace` | `8` | `regular` |
| `SUPER + SHIFT + ccedilla` | `movetoworkspace` | `9` | `regular` |
| `SUPER + SHIFT + agrave` | `movetoworkspace` | `10` | `regular` |
| `SUPER + M` | `togglespecialworkspace` | `magic` | `regular` |
| `SUPER + SHIFT + M` | `movetoworkspace` | `special:magic` | `regular` |
| `SUPER + mouse_down` | `workspace` | `e+1` | `regular` |
| `SUPER + mouse_up` | `workspace` | `e-1` | `regular` |

## Monitors & displays

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `SUPER + ALT + O` | `movewindow` | `mon:l` | `regular` |
| `SUPER + ALT + P` | `movewindow` | `mon:r` | `regular` |
| `SUPER + B` | `movecurrentworkspacetomonitor` | `l` | `regular` |
| `SUPER + N` | `movecurrentworkspacetomonitor` | `r` | `regular` |

## Screenshots & recording

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `SUPER + SHIFT + S` | `exec` | `hyprcap shot region -z -w -n` | `regular` |
| `SUPER + SHIFT + ALT + S` | `exec` | `hyprcap shot window:active -z -w -n` | `regular` |
| `SUPER + SHIFT + CTRL + S` | `exec` | `hyprcap shot -z -w -n` | `regular` |
| `SUPER + SHIFT + R` | `exec` | `hyprcap rec region -c -n` | `regular` |
| `SUPER + SHIFT + ALT + R` | `exec` | `hyprcap rec window:active -w -n` | `regular` |
| `SUPER + SHIFT + CTRL + R` | `exec` | `hyprcap rec -w -n` | `regular` |

## Media, volume & brightness

| Shortcut | Dispatcher | Params | Bind flags |
| --- | --- | --- | --- |
| `XF86AudioRaiseVolume` | `exec` | `wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+` | `repeat, locked` |
| `XF86AudioLowerVolume` | `exec` | `wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-` | `repeat, locked` |
| `XF86AudioMute` | `exec` | `wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle` | `repeat, locked` |
| `XF86AudioMicMute` | `exec` | `wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle` | `repeat, locked` |
| `XF86MonBrightnessUp` | `exec` | `brightnessctl -e4 -n2 set 5%+` | `repeat, locked` |
| `XF86MonBrightnessDown` | `exec` | `brightnessctl -e4 -n2 set 5%-` | `repeat, locked` |
| `XF86AudioNext` | `exec` | `playerctl next` | `locked` |
| `XF86AudioPause` | `exec` | `playerctl play-pause` | `locked` |
| `XF86AudioPlay` | `exec` | `playerctl play-pause` | `locked` |
| `XF86AudioPrev` | `exec` | `playerctl previous` | `locked` |
