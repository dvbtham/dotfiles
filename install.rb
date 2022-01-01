#!/usr/bin/env ruby

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
  # `brew install the_silver_searcher`
  `sudo apt-get install silversearcher-ag`
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Nope, installing zsh"
  `sudo apt-get install zsh`
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
else
  print_green "You already have zsh, awesome!"
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
