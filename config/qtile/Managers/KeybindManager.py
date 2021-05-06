# -*- coding:utf-8 -*-
from libqtile.config import Group, Key, KeyChord
from libqtile.utils import guess_terminal
from libqtile import bar, layout, widget, hook
from libqtile.lazy import lazy

mod = "mod4"
terminal = guess_terminal()


def get_asdf():
    keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key(
            [mod], "space", lazy.layout.next(), desc="Move window focus to other window"
        ),
        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key(
            [mod, "shift"],
            "h",
            lazy.layout.shuffle_left(),
            desc="Move window to the left",
        ),
        Key(
            [mod, "shift"],
            "l",
            lazy.layout.shuffle_right(),
            desc="Move window to the right",
        ),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="toggle floating"),
        Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key(
            [mod, "control"],
            "h",
            lazy.layout.grow_left(),
            desc="Grow window to the left",
        ),
        Key(
            [mod, "control"],
            "l",
            lazy.layout.grow_right(),
            desc="Grow window to the right",
        ),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key(
            [mod, "shift"],
            "Return",
            lazy.spawn("rofi -show combi"),
            desc="Toggle between split and unsplit sides of stack",
        ),
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        # Toggle between different layouts as defined below
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key(
            [mod],
            "r",
            lazy.spawn("rofi -show drun"),
            desc="Spawn a command using a prompt widget",
        ),
        KeyChord(
            ["control"],
            "e",
            [
                Key(
                    [],
                    "e",
                    lazy.spawn("emacsclient -c -a 'emacs'"),
                    desc="Launch Emacs",
                ),
                Key(
                    [],
                    "b",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(ibuffer)'"),
                    desc="Launch ibuffer inside Emacs",
                ),
                Key(
                    [],
                    "d",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(dired nil)'"),
                    desc="Launch dired inside Emacs",
                ),
                Key(
                    [],
                    "i",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(erc)'"),
                    desc="Launch erc inside Emacs",
                ),
                Key(
                    [],
                    "m",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(mu4e)'"),
                    desc="Launch mu4e inside Emacs",
                ),
                Key(
                    [],
                    "n",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(elfeed)'"),
                    desc="Launch elfeed inside Emacs",
                ),
                Key(
                    [],
                    "s",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(eshell)'"),
                    desc="Launch the eshell inside Emacs",
                ),
                Key(
                    [],
                    "v",
                    lazy.spawn("emacsclient -c -a 'emacs' --eval '(+vterm/here nil)'"),
                    desc="Launch vterm inside Emacs",
                ),
            ],
        ),
        # Monitor Switches
        Key([mod], "period", lazy.next_screen(), desc="Move focus to next monitor"),
        Key([mod], "comma", lazy.prev_screen(), desc="Move focus to prev monitor"),
        ## Treetab controls
        Key(
            [mod, "shift"],
            "h",
            lazy.layout.move_left(),
            desc="Move up a section in treetab",
        ),
        Key(
            [mod, "shift"],
            "l",
            lazy.layout.move_right(),
            desc="Move down a section in treetab",
        ),
    ]

    # Idea taken from Augusto Nicola's Dotfiles => https://github.com/AugustoNicola/dotfiles
    group_names = [
        ("SYS", {"label": "ﬦ", "layout": "columns"}),
        ("DEV", {"label": "", "layout": "columns"}),
        ("WWW", {"label": "", "layout": "columns"}),
        ("DIS", {"label": "ﭮ", "layout": "columns"}),
        ("TEAMS", {"label": "", "layout": "columns"}),
        ("DOC", {"label": "", "layout": "columns"}),
        ("MUS", {"label": "", "layout": "columns"}),
        ("VID", {"label": "嗢", "layout": "columns"}),
        ("VBOX", {"label": "", "layout": "columns"}),
    ]

    groups = [
        Group(name, init=True, persist=True, **kwargs) for name, kwargs in group_names
    ]

    for i, (name, kwargs) in enumerate(group_names, 1):
        keys.append(
            Key([mod], str(i), lazy.group[name].toscreen())
        )  # Switch to another group
        keys.append(
            Key([mod, "shift"], str(i), lazy.window.togroup(name))
        )  # Send current window to another group

    return keys, groups


if __name__ == "__main__":
    print(get_keys())
