#!/usr/bin/env bash
# Install these dotfiles. A file that would be overwritten with different content is kept as <file>.bak.
set -euo pipefail
cd "$(dirname "$0")"
put() {
  mkdir -p "$(dirname "$2")"
  [ -e "$2" ] && ! cmp -s "$1" "$2" && cp -a "$2" "$2.bak"
  install -m "${3:-644}" "$1" "$2"
  echo "  $2"
}
put tmux/tmux.conf       ~/.config/tmux/tmux.conf
put bin/rice             ~/.local/bin/rice 755
put bin/fetch-pane       ~/.local/bin/fetch-pane 755
put kitty/kitty.conf     ~/.config/kitty/kitty.conf
put fastfetch/pane.jsonc ~/.config/fastfetch/pane.jsonc
put fish/config.fish     ~/.config/fish/config.fish
echo "done — open a new terminal (fish starts the tmux layout automatically)"
