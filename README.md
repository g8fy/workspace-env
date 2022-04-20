# Productive Enviroment

This productive enviroment uses the following components:

#### Desktop Enviroment
- xmonad
- compton

#### Command Line Utilities
- zsh
- urxvt

#### Applications
- ranger
- tmux
- vim

With check_enviroment.sh you get your actual installed components.

### Addons
- urxvt perl extension
- urxvt perl extension font-size 
- Vundle for VIm
- oh-my-zsh 
- Ubuntu Mono Powerline font
- Bullet-promt theme for zsh

#### additional goodys :-)
- wicd-curses
- turses

### Prerequisites
sudo apt-get install compton rxvt-unicode-256color xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev ranger zsh vim hsetroot wicd-curses xscreensaver turses  

#### Vim
mkdir ~/.vim/tmp/backup  
mkdir ~/.vim/tmp/swap  
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  

#### urxvt
cd ~/.urxvt/ext  
wget https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size  

#### zsh  
rm -fr .oh-my-zsh/  
curl -L http://install.ohmyz.sh > install.sh  
sh install.sh  

#####Install Powerline font addon  
mkdir ~/.fonts  
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf  
fc-cache -vf  
 wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme  
 mv bullet-train.zsh-theme in $ZSH_CUSTOM/themes/  

