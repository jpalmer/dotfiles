#! /bin/bash
#local stats
conky -c ~/dotfiles/localleft   | dzen2 -xs 1 -x 0 -ta l  &
#headnode stats
ssh headnode /yossarian1/jpal8929/dotfiles/qtop.sh  | dzen2 -xs 2 -bg "black" -fg "grey" -ta l &

#clocks - has to go last
sleep 1 #sleep seems to be required to get things in the right order - also use expand so that we don't go over the other bar

conky -c ~/dotfiles/localright  | dzen2 -xs 1 -x 0 -ta r -expand left &
conky -c ~/dotfiles/localright  | dzen2 -xs 2 -x 0 -ta r -expand left &
conky -c ~/dotfiles/localright  | dzen2 -xs 3 -x 0 -ta r -expand left &

