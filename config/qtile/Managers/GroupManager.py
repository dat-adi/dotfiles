# -*- coding:utf-8 -*-

from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen

def get_groups(keys):
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
