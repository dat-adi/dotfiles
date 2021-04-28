#!/usr/bin/env bash

nitrogen --restore &
picom &
pulseaudio &
flameshot &
/usr/bin/emacs --daemon &
alsactl --file ~/.config/asound.state restore
