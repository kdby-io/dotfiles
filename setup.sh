#!/bin/zsh


# Copy config files

## Oh my zsh
ln -f .zshrc ~/.zshrc

## Tmux
ln -f .tmux.conf ~/.tmux.conf

## Neovim
mkdir -p ~/.config/nvim
ln -f init.vim ~/.config/nvim/init.vim

## Tmuxp
mkdir -p ~/.tmuxp
ln -f tumblbug-backend.yaml ~/.tmuxp/tumblbug-backend.yaml # tumblbug backend


# Restart
source ~/.zshrc
