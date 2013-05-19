#!/bin/bash
xset +fp /usr/share/fonts/local
xset +fp $home/.fonts/
xset fp rehash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset -b

urxvtd -q -o -f &
pidgin &
/home/thomas/.dropbox-dist/dropboxd &
conky&
xcompmgr &

if [ -n "$DISPLAY" ]; then
        export BROWSER=chromium
        export EDITOR=vim
        export TERM=rxvt-unicode
fi

exec awesome
