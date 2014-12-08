 #case $1 in
 #xmonad)
 #old gfx card
#xrandr --output VGA-0 --left-of DVI-0 --output HDMI-0 --rotate left --output HDMI-0 --right-of DVI-0
 #new gfx card w/ displayportsdf
#xrandr --output DVI-0 --left-of DVI-1 --output DisplayPort-0 --rotate left --output DisplayPort-0 --right-of DVI-1
#quad monitors !!!

xrandr --output DVI-0 --rotate normal --output DVI-1 --rotate normal --right-of DVI-0 --output HDMI-0 --rotate left --right-of DVI-1 --output DisplayPort-0 --rotate left --right-of HDMI-0

 # set the cursor
 xsetroot -cursor_name left_ptr
 xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
 # start xmonad
 xmobar &
 xrdb -merge ~/.Xdefaults
 exec xmonad
 #gnome)
 #exec gnome-session;;
 #esac
