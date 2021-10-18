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

# Importing system modules
import os
import subprocess

# Importing Qtile library modules
from libqtile import layout, hook
from libqtile.config import Click, Drag, Match
from libqtile.lazy import lazy

# Importing the various managers
from Managers import (
    ColorManager,
    KeybindManager,
    LayoutManager,
    ScreenManager,
    WidgetManager,
)

mod = "mod4"

# Defining the manager configuration variables
keys, groups = KeybindManager.get_asdf()
layouts = LayoutManager.get_layouts()
colors = ColorManager.darkMode()
screens = ScreenManager.get_one_screens(colors)
widget_defaults = WidgetManager.get_widget_defaults()
extension_defaults = widget_defaults.copy()
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag(["shift"], "Button1", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]
# Miscellaneous settings
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='Frame'), # Frames created for image processing
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='nm-connection-editor'),
    Match(wm_class='pcmanfm'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    ],
)

# startup script
@hook.subscribe.startup
def start_once():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])

# XXX: Don't change this property. Has to do with Java UI kits.
wmname = "LG3D"
