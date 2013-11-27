 #case $1 in
 #xmonad)
 # set the cursor
 xrandr --output VGA-0 --left-of HDMI-0 --output HDMI-0 --left-of DVI-0 --output VGA-0 --primary
 xsetroot -cursor_name left_ptr
 xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
 # start xmonad
 #xmobar &
 exec xmonad
 #gnome)
 #exec gnome-session;;
 #esac
