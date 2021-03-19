#!/bin/zsh

which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

for i in $(cat brews.txt); do
  brew install "$i";
done

ln -F .zshrc ~/.zshrc
ln -F .p10k.zsh ~/.p10k.zsh
ln -F .vimrc ~/.vimrc
