#!/bin/sh

PWD=`pwd`

## Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm $PWD/.tmux/plugins/tpm
ln -sf $PWD/.tmux.conf ~/.tmux.conf

## neovim
brew install neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

## zsh
brew install zsh zsh-completions

## pyenv
brew install pyenv

## thefuck
brew install thefuck

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $PWD/.zshrc ~/.zshrc
source ~/.zshrc

## nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install stable

## pure
npm install --global pure-prompt

echo "Done! Reopen a terminal";
