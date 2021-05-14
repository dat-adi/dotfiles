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
from Managers import (
    ColorManager,
    KeybindManager,
    LayoutManager,
    ScreenManager,
    WidgetManager,
)

# TODO: Dynamically check on startup as to whether HDMI port is connected to a display and use one/two screens
# Utilization of the Managers
keys, groups = KeybindManager.get_asdf()
layouts = LayoutManager.get_layouts()
colors = ColorManager.hollowknight()
screens = ScreenManager.get_one_screens(colors)
widget_defaults = WidgetManager.get_widget_defaults()
extension_defaults = widget_defaults.copy()

# Miscellaneous settings
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# startup script
@hook.subscribe.startup
def start_once():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# XXX: Don't change this property. Has to do with Java UI kits.
wmname = "LG3D"
