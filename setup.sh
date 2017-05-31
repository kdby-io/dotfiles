#!/bin/zsh

PWD=`pwd`

# Copy config files

## Oh my zsh
ln -sf $PWD/.zshrc ~/.zshrc

## Tmux
ln -sf $PWD/.tmux.conf ~/.tmux.conf

## Neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

## Tmuxp
mkdir -p ~/.tmuxp
ln -sf $PWD/tumblbug-backend.yaml ~/.tmuxp/tumblbug-backend.yaml # tumblbug backend


# Restart
source ~/.zshrc
