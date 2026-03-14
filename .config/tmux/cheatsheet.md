# Tmux Cheatsheet

Based on your current `~/.config/tmux/tmux.conf`.

## Core
- Prefix: `Ctrl-y`
- Send prefix to a nested tmux session: `Prefix Ctrl-y`
- Reload tmux config: `Prefix r`
- Attach/switch session in current path: `Prefix M-c`
- Mouse mode: on
- Clipboard integration: on
- Window numbering starts at `1`
- Pane numbering starts at `1`
- Windows renumber automatically
- Window titles auto-name from the current directory

## Panes and Windows
- Split pane left/right: `Prefix =`
- Split pane top/bottom: `Prefix -`
- Resize left: `Prefix h`
- Resize down: `Prefix j`
- Resize up: `Prefix k`
- Resize right: `Prefix l`
- Toggle pane zoom: `Prefix m`
- Sync panes command: `Prefix S`

## Copy Mode
- Uses `vi` keys in copy mode
- Start selection: `v`
- Copy selection: `y`
- Mouse drag does not kick you out of copy mode

## Fast Navigation (No Prefix)
- Move left: `Ctrl-h`
- Move down: `Ctrl-j`
- Move up: `Ctrl-k`
- Move right: `Ctrl-l`
- Jump to the previous pane: `Ctrl-\\`
- In Vim or Neovim, these keys pass through to the editor instead

## Visual and Behavior
- Theme: `Catppuccin (mocha)`
- Status bar position: `bottom`
- Status layout: session on the left, active windows in the middle, `user@host`, current directory, and `date/time` on the right
- History limit: `1,000,000`
- Escape time: `10`
- Active pane border uses a blue accent

## Installed Plugins
- `tmux-plugins/tpm`
- `tmux-plugins/tmux-sensible`
- `christoomey/vim-tmux-navigator`
- `catppuccin/tmux`
- `tmux-plugins/tmux-yank`
- `tmux-plugins/tmux-resurrect`
- `tmux-plugins/tmux-continuum`

## Useful Paths
- Main config: `~/.config/tmux/tmux.conf`
- Cheatsheet command: `tmux-cheatsheet`
