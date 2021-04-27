# -*- UTF-8 -*-

# -----------------------------------------
#        _       _                   _ _
#       | |     | |                 | (_)
#     __| | __ _| |_ ______ __ _  __| |_
#    / _` |/ _` | __|______/ _` |/ _` | |
#   | (_| | (_| | |_      | (_| | (_| | |
#    \__,_|\__,_|\__|      \__,_|\__,_|_|
#
# -----------------------------------------
#
#         Instagram : dat.adithya
#            GitHub : @dat-adi
#
# -----------------------------------------

import os
import socket
from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.spawn("rofi -show combi"),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show drun"),
        desc="Spawn a command using a prompt widget"),

    # Window switches
    # Key(["alt"], "Tab", lazy.spawn('rofi -show window'), desc="Window Switcher"),

    # Monitor Switches
    Key([mod], "period", lazy.next_screen(),
             desc='Move focus to next monitor'),
    Key([mod], "comma", lazy.prev_screen(),
        desc='Move focus to prev monitor'),

    ## Treetab controls
    Key([mod, "shift"], "h", lazy.layout.move_left(),
            desc='Move up a section in treetab'),
    Key([mod, "shift"], "l", lazy.layout.move_right(),
            desc='Move down a section in treetab'),

]

group_names = [("SYS", {'layout': 'columns'}),
               ("DEV", {'layout': 'columns'}),
               ("WWW", {'layout': 'columns'}),
               ("DIS", {'layout': 'columns'}),
               ("TEAMS", {'layout': 'columns'}),
               ("DOC", {'layout': 'columns'}),
               ("MUS", {'layout': 'columns'}),
               ("VID", {'layout': 'columns'}),
               ("VBOX", {'layout': 'columns'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 2,
                "margin": 2,
                "border_focus": "2E7588",
                "border_normal": "1D2330"
                }

layouts = [
    # layout.Bsp(),
    # layout.MonadWide(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    # layout.Max(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    layout.Matrix(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.TreeTab(
         font = "Source Code Pro",
         fontsize = 10,
         sections = ["FIRST", "SECOND", "THIRD", "FOURTH"],
         section_fontsize = 10,
         border_width = 2,
         bg_color = "1c1f24",
         active_bg = "2E7588",
         active_fg = "000000",
         inactive_bg = "a9a1e1",
         inactive_fg = "1c1f24",
         padding_left = 0,
         padding_x = 0,
         padding_y = 5,
         section_top = 10,
         section_bottom = 20,
         level_shift = 8,
         vspace = 3,
         panel_width = 200
        ),
]


'''
# DT Colors
colors = [["#2a2a2a", "#2a2a2a"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens
'''

# Hollow Knight Theme
# Black :  #06090A
# Blue  :  #5CA0A4
# Green :  #9BC3BC
# Dark Blue :  #2E7588
# Blue-Black : #111B1F

colors = [["#06090A", "#06090A"], # panel background
          ["#06090A", "#111b1f"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#9BC3BC", "#9BC3BC"], # border line color for current tab
          ["#2E7588", "#2E7588"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#2E7588", "#2E7588"], # color for the 'even widgets'
          ["#9BC3BC", "#9BC3BC"], # window name
          ["#5CA0A4", "#5CA0A4"]] # background for inactive screens

widget_defaults = dict(
    font='Ubuntu Mono',
    fontsize=9,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    foreground = colors[0],
                    background = colors[1],
                    padding = 0,
                    scale = 0.7
                    ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[2],
                    background = colors[0]
                    ),
                widget.GroupBox(
                    font = "Ubuntu Bold",
                    fontsize = 9,
                    margin_y = 3,
                    margin_x = 0,
                    padding_y = 5,
                    padding_x = 3,
                    borderwidth = 3,
                    active = colors[2],
                    inactive = colors[7],
                    rounded = False,
                    highlight_color = colors[1],
                    highlight_method = "line",
                    this_current_screen_border = colors[6],
                    this_screen_border = colors[4],
                    other_current_screen_border = colors[6],
                    other_screen_border = colors[4],
                    foreground = colors[2],
                    background = colors[0]
                    ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[2],
                    background = colors[0]
                    ),
                widget.Sep(
                    linewidth = 0,
                    padding = 40,
                    foreground = colors[2],
                    background = colors[0]
                    ),
                widget.WindowName(
                    foreground = colors[6],
                    background = colors[0],
                    padding = 0
                    ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#0000ff", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(
                    "Dat Adi",
                    name="name",
                    font = "Sauce Code Pro Bold",
                    background = colors[0],
                    foreground = colors[3]
                    ),
                widget.Systray(
                    background = colors[0],
                    padding = 5
                    ),
                widget.Clock(
                    format='%d-%m-%Y | %a %I:%M %p',
                    background = colors[0],
                    padding=10
                    ),
                widget.Battery(
                    font="Source Code Pro Bold",
                    background = colors[4],
                    notify_below = 20,
                    low_percentage = 0.2,
                    format="{char} | {percent:2.0%}",
                    padding=10
                    ),
            ],
            24,
        ),
    ),
    '''
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(
                    "Dat Adi",
                    name="name",
                    foreground="#d75f5f"
                    ),
                widget.Systray(),
                widget.Clock(
                    format='%d-%m-%Y %a %I:%M %p',
                    padding=10
                    ),
            ],
            24,
        ),
    ),
    '''
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
