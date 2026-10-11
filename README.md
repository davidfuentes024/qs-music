# qs-music

A music module for [Quickshell](https://quickshell.org): a bar button with a
mouse-friendly song panel, and **synced lyrics floating over your desktop**.
Works with any MPRIS player (Spotify, browsers, mpv...) and has extra controls
for [spotify_player](https://github.com/aome510/spotify-player).

- **Music button**: an icon for your bar. Click it for a panel with the song,
  artist, a seekable progress bar, previous / play / next, shuffle, repeat and
  a volume bar (click, drag or scroll).
- **Lyrics overlay**: time-synced lyrics from [LRCLIB](https://lrclib.net)
  (free, no account) in a box that floats over every window. Lines glide
  smoothly; clicks pass through it. An edit mode lets you drag and resize it,
  and the position is remembered.
- **spotify_player support**: it exposes shuffle, repeat and volume nowhere
  but its own CLI, so qs-music drives it through that, and adds a like button.
- **Themeable**: every color and the font live in one singleton.

## Requirements

- Quickshell 0.3 or newer
- A [Nerd Font](https://www.nerdfonts.com) for the icons (JetBrainsMono Nerd Font by default)
- Optional: `spotify_player` for its extra controls

## Install

Put the folder inside your Quickshell config, e.g. as a git submodule:

```sh
cd ~/.config/quickshell
git submodule add https://github.com/davidfuentes024/qs-music qs-music
```

or simply `git clone` it there. Quickshell only imports modules that live
inside the config folder.

To try it on its own first: `qs -p /path/to/qs-music` (runs `shell.qml`, a
minimal bar).

## Usage

```qml
//@ pragma UseQApplication
import Quickshell
import "qs-music"

ShellRoot {
    PanelWindow {
        anchors { top: true; left: true; right: true }
        implicitHeight: 28

        MusicButton { anchors.centerIn: parent }
    }

    LyricsOverlay {}
}
```

### Commands

Bind these in your compositor:

| Command | Action |
| --- | --- |
| `qs ipc call lyrics toggle` | Show / hide the lyrics |
| `qs ipc call lyrics edit` | Edit mode: drag to move, drag the corner to resize; run again to save |
| `qs ipc call music togglePanel` | Open / close the song panel |

Hyprland example (`hyprland.conf`):

```
bind = SUPER SHIFT, L, exec, qs ipc call lyrics toggle
bind = SUPER SHIFT, K, exec, qs ipc call lyrics edit
# Frosted lyrics box
layerrule = blur, qs-music-lyrics
layerrule = ignorealpha 0.1, qs-music-lyrics
```

## Styling

`MusicStyle` holds every color, the font and the lyrics box opacity. Override
what you need from your shell:

```qml
Binding { target: MusicStyle; property: "accent"; value: "#c8a96e" }
Binding { target: MusicStyle; property: "font"; value: "GeistMono Nerd Font" }
```

| Property | Used for |
| --- | --- |
| `bg`, `bgAlt` | Backgrounds; `bgAlt` for the panel and lyrics box |
| `surface`, `overlay` | Bars, hover backgrounds, borders |
| `fg`, `fgDim` | Text and secondary text |
| `accent` | Playing state, progress, active toggles |
| `red` | Like button |
| `font`, `fontSize` | Text and icons |
| `lyricsBackgroundOpacity` | Lyrics box background, 0 to 1 |

## How lyrics are matched

On each song change qs-music asks LRCLIB for synced lyrics by title, artist
and duration. Results whose duration differs by more than 3 seconds are
rejected, because lyrics timed for another version of the song (radio edit,
remaster, live) drift out of sync. Only the title, artist and duration are
sent to LRCLIB.

Settings are saved in `~/.local/state/qs-music/lyrics.json`.

## License

MIT
