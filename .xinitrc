#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
# 自定义键盘映射
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

synclient TabButton1 1 &
synclient TabButton2 3 &
synclient TabButton3 2 &

xset r rate 300 80
notify &
clipmenud &
xrandr --output eDP1 --mode 1920x1080 --left-of DP-2 &
# xrandr --output DP-1-2 --mode 3840x2160 --right-of eDP1
dunst &
mpd &
fcitx-autostart &
dwmblocks &
picom &
dwm
