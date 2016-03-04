#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "i3 -> " $(dpkg -s i3 | grep Version:) "${YELLOW}[4.7]${NC}"
echo -e "ranger -> " $(dpkg -s ranger | grep Version:) "${YELLOW}[1.7.1]${NC}"
echo -e "Tmux -> " $(dpkg -s tmux | grep Version:) "${YELLOW}[1.9]${NC}"
echo -e "urxvt -> " $(dpkg -s rxvt-unicode-256color | grep Version:) "${YELLOW}[9.19]${NC}"
echo -e "Vim -> " $(dpkg -s vim | grep Version:) "${YELLOW}[7.4]${NC}"
if [ ! -d ~/.vim/bundle ]; 
then
				echo -e "${RED}VIM without vundle support!${NC}";
else
				echo -e "${GREEN}VIM with vundle support!${NC}"
fi

if [ ! -d ~/.fonts/ubuntu-mono-powerline-ttf ]; 
then
				echo -e "${RED}Ubuntu Mono Powerline font not installed!${NC}";
else
				echo -e "${GREEN}Ubuntu Mono Powerline font installed!${NC}"
fi


