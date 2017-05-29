#!/bin/zsh


# Copy config files

## Oh my zsh
ln -sf .zshrc ~/.zshrc

## Tmux
ln -sf .tmux.conf ~/.tmux.conf

## Neovim
mkdir -p ~/.config/nvim
ln -sf init.vim ~/.config/nvim/init.vim

## Tmuxp
mkdir -p ~/.tmuxp
ln -sf tumblbug-backend.yaml ~/.tmuxp/tumblbug-backend.yaml # tumblbug backend


# Restart
source ~/.zshrc
