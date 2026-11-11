# dotfiles: Hollow Knight terminal

My terminal setup: tmux, fish and kitty in a *Hollow Knight* palette, plus an animated sysinfo pane. It pairs with the [Hallownest KDE theme](https://github.com/saadelhadaoui/hallownest-kde) but works on its own.

| File | Goes to | What it is |
|---|---|---|
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` | Prefix `Ctrl-a`, `\|` / `-` splits, vim-style `h j k l` pane moves, mouse on, status bar on top in the Hallownest palette, synchronized output (no cursor flicker next to the animated pane) |
| `bin/rice` | `~/.local/bin/rice` | Opens the layout: sysinfo pane on the left, shell on the right. A second terminal gets its own throwaway session |
| `bin/fetch-pane` | `~/.local/bin/fetch-pane` | The animated sysinfo pane (below) |
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` | Hallownest colours, Hack 11 |
| `fastfetch/pane.jsonc` | `~/.config/fastfetch/pane.jsonc` | System info shown in the pane |
| `fish/config.fish` | `~/.config/fish/config.fish` | Starts `rice` in every new interactive terminal (not inside tmux, SSH or VS Code), plus Hallownest syntax colours |

## Install

```sh
git clone https://github.com/saadelhadaoui/dotfiles.git
cd dotfiles && ./install.sh
```

Any file it would overwrite with different content is kept next to it as `<file>.bak`.

Needs: `tmux` (3.4+), `fish`, `fastfetch`, `python3` with Pillow (`python3-pillow`). Optional: `kitty`.

## The sysinfo pane

`fetch-pane` shows:

- **Art:** an animated Knight drawn in text characters, matched cell by cell to an image (floating, cloak ripple, drifting soul motes). Bring your own: put a Knight image with a transparent background at `~/.local/share/fetch-pane/knight.png`. Without it the pane shows info only.
- **System info** from fastfetch.
- **hallownest:** your city (from your IP via ipinfo.io), today's Hijri date, weather from Open-Meteo, the five prayer times from AlAdhan and a countdown to the next one. Fetched in the background and cached in `~/.cache/fetch-pane/`.
- **Live stats:** CPU sparkline, RAM, battery, CPU temperature, uptime and clock.

Prayer times use AlAdhan method 3 (Muslim World League) by default. Pick yours from [the method list](https://aladhan.com/calculation-methods) and set it, for example in fish:

```fish
set -Ux PRAYER_METHOD 2
```

In kitty you can show a real animated GIF instead of the text art: put it at `~/.local/share/fetch-pane/knight.gif` and change `fetch-pane` to `fetch-pane --gif` in `bin/rice`.

## Licence

MIT. *Hollow Knight* is © Team Cherry; no game art is included.
