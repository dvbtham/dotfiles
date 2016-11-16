#!/usr/bin/env bash

echo "Checking if Vundle exists..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Nope, installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "You already have Vundle, awesome!"
fi

echo "Checking if zsh is installed"
if [ ! -n $ZSH_VERSION ]; then
  echo "Nope, installing zsh"
  sudo apt-get install zsh
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
  echo "You already have zsh, awesome!"
fi

echo "Checking if honukai theme is installed"
if [ ! -f ~/.oh-my-zsh/themes/honukai.zsh-theme ]; then
  echo "Nope, installing honukai theme"
  wget -P ~/.oh-my-zsh/themes "https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme"
else
  echo "You already have honukai theme, awesome!"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copying $DIR/.vimrc to ~/.vimrc"
cp $DIR/.vimrc ~/.vimrc
echo "Copying $DIR/.gitconfig to ~/.gitconfig"
cp $DIR/.gitconfig ~/.gitconfig
