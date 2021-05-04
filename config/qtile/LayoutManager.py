# -*- coding:utf-8 -*-
from libqtile import layout

def get_layouts():
    layout_theme = {
        "border_width": 2,
        "margin": 2,
        "border_focus": "2E7588",
        "border_normal": "1D2330",
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
            font="Source Code Pro",
            fontsize=10,
            sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
            section_fontsize=10,
            border_width=2,
            bg_color="1c1f24",
            active_bg="2E7588",
            active_fg="000000",
            inactive_bg="a9a1e1",
            inactive_fg="1c1f24",
            padding_left=0,
            padding_x=0,
            padding_y=5,
            section_top=10,
            section_bottom=20,
            level_shift=8,
            vspace=3,
            panel_width=200,
        ),
    ]

    return layouts
