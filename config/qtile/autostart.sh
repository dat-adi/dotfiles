#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Fonts
xset +fp /usr/share/fonts/TTF/
xset +fp /usr/share/fonts/OTF/


# start some programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60.00 --output HDMI-1 --mode 3440x1440 --rate 60.00 --right-of eDP-1
nitrogen --restore &
picom &
alsactl --file ~/.config/asound.state restore
pulseaudio &
flameshot &
/usr/bin/emacs --daemon &