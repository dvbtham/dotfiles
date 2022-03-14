#!/usr/bin/env ruby
require './os.rb'

def print_cyan(text)
  puts "\e[36m#{text}\e[0m"
end

def print_green(text)
  puts "\e[32m#{text}\e[0m"
end

def print_red(text)
  puts "\e[31m#{text}\e[0m"
end

def path(filepath)
  File.expand_path(filepath)
end

print_cyan "Checking if vim-plug exists..."
if File.exists? path("~/.vim/autoload/plug.vim")
  print_green "You already have vim-plug, awesome!"
else
  print_red "Nope, installing vim-plug"
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
end

print_cyan "Checking if ag exists..."
if Dir.exists? path("/usr/local/Cellar/the_silver_searcher/")
  print_green "You already have ag, awesome!"
else
  print_red "Nope, installing ag"
  if OS.mac?
    `brew install the_silver_searcher`
  else
    `sudo apt-get install silversearcher-ag`
  end
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Nope, installing zsh"
  `sudo apt-get install zsh` if OS.linux?
  `brew install zsh` if OS.mac?
else
  print_green "You already have zsh, awesome!"
end

print_cyan "Checking if oh-my-zsh is installed"
if File.exists? path("~/.oh-my-zsh")
  print_green "You already have oh-my-zsh, awesome!"
else
  print_red "Nope, installing oh-my-zsh..."
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  `git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`
end

print_cyan "Checking if ngaicojal theme is installed"
if File.exists? path("~/.oh-my-zsh/themes/ngaicojal.zsh-theme")
  print_green "You already have ngaicojal theme, awesome!"
else
  print_red "Nope, installing ngaicojal theme..."
  `cp -i zsh/themes/ngaicojal.zsh-theme ~/.oh-my-zsh/themes`
end

print_cyan "Copying vimrc to ~/.vimrc"
`cp -i vimrc ~/.vimrc`
print_cyan "Copying .gitconfig to ~/.gitconfig"
`cp -i .gitconfig ~/.gitconfig`
print_cyan "Copying zsh/zshrc to ~/.zshrc"
`cp -i zsh/zshrc ~/.zshrc`
print_cyan "Copying gemrc"
`cp -i gemrc ~/.gemrc`
