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
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from Managers import ColorManager, KeybindManager, LayoutManager, ScreenManager

mod = "mod4"

# TODO: Dynamically check on startup as to whether HDMI port is connected to a display and use one/two screens
keys, groups = KeybindManager.get_asdf()
layouts = LayoutManager.get_layouts()
colors = ColorManager.hollowknight()
screens = ScreenManager.get_two_screens(colors)

widget_defaults = dict(
    font="JetBrains Mono Bold",
    fontsize=9,
    padding=3,
)

extension_defaults = widget_defaults.copy()


# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


@hook.subscribe.startup
def start_once():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
