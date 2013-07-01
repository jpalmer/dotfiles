 # set the cursor
 xsetroot -cursor_name left_ptr
xrandr --output HDMI2 --right-of VGA1
 xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
 # start xmonad
 xmobar &
 exec xmonad
