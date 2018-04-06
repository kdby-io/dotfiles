#!/bin/zsh

# Install

## Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## tmux
brew install tmux

## vim
brew install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall

## zsh
brew install zsh zsh-completions

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install stable

## pure
npm install --global pure-prompt

## yarn
brew install yarn --without-node

## pyenv
brew install pyenv

## thefuck
brew install thefuck

PWD=`pwd`


# Copy config files

## Oh my zsh
ln -sf $PWD/.zshrc ~/.zshrc

## Tmux
git clone https://github.com/tmux-plugins/tpm $PWD/.tmux/plugins/tpm
ln -sf $PWD/.tmux.conf ~/.tmux.conf

## Vim
ln -sf $PWD/.vimrc ~/.vimrc

## Hyper
ln -sf $PWD/.hyper.js ~/.hyper.js

# Restart
source ~/.zshrc
