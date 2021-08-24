#!/bin/sh

#
# Развертывание необходимых скриптов и конфигов
#

# Установка необходимых программ
sudo ./pacman.sh

# Скрипты монтирования
sudo cp -R ./mnt /opt
sudo chown :storage /opt/mnt

# Скрипты xrandr
sudo cp -R ./scripts /opt
sudo chown dimsharav:dimsharav /opt/scripts

# Конфигурация SLiM
sudo cp etc/slim.conf /etc

# Пользовательские dotfiles
cp -R ./home/* ~/

echo "For ~/.vim directory use git:"
echo "  git clone git@mars.prk.local:vim"
echo
echo "For oh-my-zsh use git:"
echo "  git clone git://github.com/robbyrussell/oh-my-zsh.git"
