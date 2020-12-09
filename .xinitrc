[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# while true; do
    # Log stderror to a file 
    # dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
# done
# i3
dwm 2> ~/.dwm.log
# disable the bell sound
xset b off
# disable monitor blacking off after some time
# xset s off -dpms
