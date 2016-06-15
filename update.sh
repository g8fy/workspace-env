#!/bin/bash
if [ ! -f ~/.vimrc  ]; then
				echo ".vimrc not found!"
				exit 1
fi
if [ ! -f ~/.tmux.conf  ]; then
				echo ".tmux.conf not found!"
				exit 1
fi
if [ ! -f ~/.Xdefaults  ]; then
				echo ".Xdefaults not found!"
				exit 1
fi
if [ ! -f ~/.zshrc  ]; then
				echo ".zshrc not found!"
				exit 1
fi
if [ ! -f ~/.xmonad/xmonad.hs ]; then
				echo "xmonad not found!"
				exit 1
fi

cp .vimrc ~
cp .tmux.conf ~
cp .Xdefaults ~
cp .Xresources ~
cp .xinitrc ~
#sed -i -e 's/%%USER%%/'$USER'/g' .zshrc
cp .zshrc ~
#sed -i -e 's/'$USER'/%%USER%%/g' .zshrc
cp xmonad.hs ~/.xmonad/
cp .xmobarrc ~
cp .compton.conf ~
cp ranger/rc.conf ~/.config/ranger/rc.conf



#cp .i3/config ~/.i3/config
echo "Ready"
