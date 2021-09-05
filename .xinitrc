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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

while true; do

KERNEL=$(kernel)
MEM=$(mem)
CPU=$(cpu)
HDD=$(hdd)
UPT=$(upt)
VOL=$(volume)
CLOCK=$(clock)

# xsetroot -name "${LBG}${KERNEL}${DBG}${CPU}${LBG}${MEM}${DBG}${HDD}${LBG}${UPT}${DBG}${VOL}${LBG}${CLOCK}"
xsetroot -name "^c#b8bb26^    ${KERNEL}  ^c#928374^|^c#fb4934^  力  ${CPU}  ^c#928374^|^c#fabd2f^    ${MEM}  ^c#928374^|^c#458588^    ${HDD}  ^c#928374^|^c#d3869b^    ${UPT}  ^c#928374^|^c#8ec07c^    ${VOL}  ^c#928374^|^c#ebdbb2^ ${CLOCK}   dwm-6.2"


# xsetroot -name "[status2d] ^c#FF0000^red text with blue rectangle^c#55cdfc^^r3,3,14,14^^f20^^c#FFFFFF^^b#f7a8b8^ and white text on pink background "

sleep 1s
done &

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login
