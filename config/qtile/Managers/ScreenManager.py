# -*- coding:utf-8 -*-
import os
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen


def get_two_screens(colors):
    groupbox_defaults = dict(
        margin_y=3,
        margin_x=0,
        padding_y=7,
        padding_x=7,
        borderwidth=3,
        active=colors[2],
        inactive=colors[7],
        rounded=False,
        highlight_color=colors[1],
        highlight_method="line",
        this_current_screen_border=colors[6],
        this_screen_border=colors[4],
        other_current_screen_border=colors[6],
        other_screen_border=colors[4],
        foreground=colors[2],
        background=colors[0],
    )
    screens = [
        Screen(
            bottom=bar.Bar(
                [
                    widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground=colors[0],
                        background=colors[1],
                        padding=0,
                        scale=0.7,
                    ),
                    widget.Sep(
                        linewidth=0,
                        padding=6,
                        foreground=colors[2],
                        background=colors[0],
                    ),
                    widget.GroupBox(
                        visible_groups=["SYS"],
                        font="FiraCode Nerd Font",  # ? using the font is vital for loading the icon
                        fontsize=15,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DEV"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["WWW"],
                        font="Font Awesome 5 Free",
                        fontsize=25,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DIS"],
                        font="FiraCode Nerd Font",
                        fontsize=16,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["TEAMS"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DOC"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["MUS"],
                        font="Font Awesome 5 Free",
                        fontsize=27,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VID"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VBOX"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.Spacer(10),
                    # WindowName
                    widget.WindowName(
                        format="﫳 {name}",
                        max_chars=80,
                        background=colors[0],
                        foreground=colors[6],
                    ),
                    widget.Chord(
                        chords_colors={
                            "launch": ("#0000ff", "#ffffff"),
                        },
                        name_transform=lambda name: name.upper(),
                    ),
                    widget.Systray(icon_size=16, background=colors[0], padding=5),
                    widget.Spacer(10),
                    # Backlight
                    widget.TextBox(
                        text="", padding=8, foreground=colors[3], fontsize=25
                    ),
                    widget.Backlight(
                        foreground=colors[3],
                        change_command="light -S {0}",
                        backlight_name="intel_backlight",
                    ),
                    widget.Spacer(10),
                    widget.CheckUpdates(
                        update_interval=1800,
                        distro="Arch",
                        display_format="{updates} Updates",
                        mouse_callbacks={
                            "Button1": lambda: qtile.cmd_spawn(
                                "alacritty -e sudo pacman -Syu"
                            )
                        },
                        foreground=colors[3],
                    ),
                    widget.Spacer(10),
                    # Volume
                    widget.TextBox(
                        text="墳", foreground=colors[3], padding=6, fontsize=23
                    ),
                    widget.Volume(foreground=colors[3]),
                    widget.Spacer(10),
                    # Time
                    widget.TextBox(
                        text="", fontsize=21, padding=6, foreground=colors[3]
                    ),
                    widget.Clock(foreground=colors[3], format="%d-%m-%Y | %a %I:%M %p"),
                    widget.Spacer(10),
                    # CPU
                    widget.TextBox(
                        text="", fontsize=23, padding=8, foreground=colors[3]
                    ),
                    widget.CPU(format="{load_percent}%", foreground=colors[3]),
                    widget.Spacer(10),
                    # Battery
                    widget.TextBox(text="", fontsize=14, foreground=colors[3]),
                    widget.Battery(
                        foreground=colors[3],
                        low_foreground="d08770",
                        format="{percent:2.0%}",
                    ),
                    widget.Spacer(10),
                ],
                24,
                background=colors[0],
            ),
        ),
        Screen(
            bottom=bar.Bar(
                [
                    widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground=colors[0],
                        background=colors[1],
                        padding=0,
                        scale=0.7,
                    ),
                    widget.Sep(
                        linewidth=0,
                        padding=6,
                        foreground=colors[2],
                        background=colors[0],
                    ),
                    widget.GroupBox(
                        visible_groups=["SYS"],
                        font="FiraCode Nerd Font",  # ? using the font is vital for loading the icon
                        fontsize=15,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DEV"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["WWW"],
                        font="Font Awesome 5 Free",
                        fontsize=25,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DIS"],
                        font="FiraCode Nerd Font",
                        fontsize=16,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["TEAMS"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DOC"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["MUS"],
                        font="Font Awesome 5 Free",
                        fontsize=27,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VID"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VBOX"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.Spacer(10),
                    # WindowName
                    widget.WindowName(
                        format="﫳 {name}",
                        max_chars=80,
                        background=colors[0],
                        foreground=colors[6],
                    ),
                    widget.Chord(
                        chords_colors={
                            "launch": ("#0000ff", "#ffffff"),
                        },
                        name_transform=lambda name: name.upper(),
                    ),
                    widget.Systray(icon_size=16, background=colors[0], padding=5),
                    widget.Spacer(10),
                    # Backlight
                    widget.TextBox(
                        text="", padding=8, foreground=colors[3], fontsize=25
                    ),
                    widget.Backlight(
                        foreground=colors[3],
                        change_command="light -S {0}",
                        backlight_name="intel_backlight",
                    ),
                    widget.Spacer(10),
                    # Volume
                    widget.TextBox(
                        text="墳", foreground=colors[3], padding=6, fontsize=23
                    ),
                    widget.Volume(foreground=colors[3]),
                    widget.Spacer(10),
                    # Time
                    widget.TextBox(
                        text="", fontsize=21, padding=6, foreground=colors[3]
                    ),
                    widget.Clock(foreground=colors[3], format="%d-%m-%Y | %a %I:%M %p"),
                    widget.Spacer(10),
                    # CPU
                    widget.TextBox(
                        text="", fontsize=23, padding=8, foreground=colors[3]
                    ),
                    widget.CPU(format="{load_percent}%", foreground=colors[3]),
                    widget.Spacer(10),
                    # Battery
                    widget.TextBox(text="", fontsize=14, foreground=colors[3]),
                    widget.Battery(
                        foreground=colors[3],
                        low_foreground="d08770",
                        format="{percent:2.0%}",
                    ),
                    widget.Spacer(10),
                ],
                24,
                background=colors[0],
            ),
        ),
    ]

    return screens


def get_one_screens(colors):
    groupbox_defaults = dict(
        margin_y=3,
        margin_x=0,
        padding_y=5,
        padding_x=7,
        borderwidth=3,
        active=colors[2],
        inactive=colors[7],
        rounded=False,
        highlight_color=colors[1],
        highlight_method="line",
        this_current_screen_border=colors[6],
        this_screen_border=colors[4],
        other_current_screen_border=colors[6],
        other_screen_border=colors[4],
        foreground=colors[2],
        background=colors[0],
    )

    screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground=colors[0],
                        background=colors[1],
                        padding=0,
                        scale=0.7,
                    ),
                    widget.Sep(
                        linewidth=0,
                        padding=6,
                        foreground=colors[2],
                        background=colors[0],
                    ),
                    widget.GroupBox(
                        visible_groups=["SYS"],
                        font="FiraCode Nerd Font",  # ? using the font is vital for loading the icon
                        fontsize=15,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DEV"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["WWW"],
                        font="Font Awesome 5 Free",
                        fontsize=25,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DIS"],
                        font="FiraCode Nerd Font",
                        fontsize=16,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["TEAMS"],
                        font="FiraCode Nerd Font",
                        fontsize=17,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["DOC"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["MUS"],
                        font="Font Awesome 5 Free",
                        fontsize=27,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VID"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.GroupBox(
                        visible_groups=["VBOX"],
                        font="Font Awesome 5 Free",
                        fontsize=20,
                        **groupbox_defaults
                    ),
                    widget.Spacer(500),
                    # WindowName
                    widget.WindowName(
                        format="{name}",
                        font="Ubuntu Mono Bold",
                        fontsize=10,
                        max_chars=80,
                        background=colors[0],
                        foreground=colors[6],
                    ),
                    widget.Chord(
                        chords_colors={
                            "launch": ("#0000ff", "#ffffff"),
                        },
                        name_transform=lambda name: name.upper(),
                    ),
                    widget.Systray(icon_size=16, background=colors[0], padding=5),
                    widget.Spacer(10),
                    # Backlight
                    widget.TextBox(
                        text="", padding=8, foreground=colors[3], fontsize=25
                    ),
                    widget.Backlight(
                        foreground=colors[3],
                        change_command="light -S {0}",
                        backlight_name="intel_backlight",
                    ),
                    widget.Spacer(10),
                    widget.CheckUpdates(
                        update_interval=1800,
                        distro="Arch",
                        display_format="{updates} Updates",
                        mouse_callbacks={
                            "Button1": lambda: qtile.cmd_spawn(
                                "alacritty -e sudo pacman -Syu"
                            )
                        },
                        foreground=colors[3],
                    ),
                    widget.Spacer(10),
                    # Volume
                    widget.TextBox(
                        text="墳", foreground=colors[3], padding=6, fontsize=23
                    ),
                    widget.Volume(foreground=colors[3]),
                    widget.Spacer(10),
                    # Time
                    widget.TextBox(
                        text="", fontsize=21, padding=6, foreground=colors[3]
                    ),
                    widget.Clock(foreground=colors[3], format="%d-%m-%Y | %a %I:%M %p"),
                    widget.Spacer(10),
                    # CPU
                    widget.TextBox(
                        text="", fontsize=23, padding=8, foreground=colors[3]
                    ),
                    widget.CPU(format="{load_percent}%", foreground=colors[3]),
                    widget.Spacer(10),
                    # Battery
                    widget.TextBox(text="", fontsize=14, foreground=colors[3]),
                    widget.Battery(
                        foreground=colors[3],
                        low_foreground="d08770",
                        format="{percent:2.0%}",
                    ),
                    widget.Spacer(10),
                ],
                24,
                background=colors[0],
            ),
        ),
    ]

    return screens
