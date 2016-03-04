#!/bin/bash
if [ -z "$1" ]
then
				echo "No argument supplied"
				exit 1
fi
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

cp .vimrc ~
cp .tmux.conf ~
cp .Xdefaults ~
sed -i -e 's/%%USER%%/'$1'/g' .zshrc
cp .zshrc ~
sed -i -e 's/'$1'/%%USER%%/g' .zshrc
echo "Ready"
