#if [ -f $HOME/.Xresources  ]; then 
#	xrdb -load $HOME/.xresources 
#fi 
#xrdb -load $HOME/.Xdefaults
xrdb $HOME/.Xresources &
xscreensaver -no-splash & 
urxvtd -q -o -f &
compton &
ruby ~/bg_setter.rb
exec ck-launch-session dbus-launch bash -c "xmonad"
