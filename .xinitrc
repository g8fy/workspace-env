#if [ -f $HOME/.Xresources  ]; then 
#	xrdb -load $HOME/.xresources 
#fi 
xrdb -load $HOME/.Xdefaults
xscreensaver -no-splash & 
urxvtd -q -o -f &
compton &
ruby ~/bg_setter.rb
xrdb $HOME/.Xresources &
xmonad
