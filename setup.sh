#!/bin/zsh

PWD=`pwd`

# Copy config files

## Oh my zsh
ln -sf $PWD/.zshrc ~/.zshrc

## Tmux
git clone https://github.com/tmux-plugins/tpm $PWD/.tmux/plugins/tpm
ln -sf $PWD/.tmux.conf ~/.tmux.conf

## Vim
ln -sf $PWD/.vimrc ~/.vimrc

## Tmuxp
mkdir -p ~/.tmuxp
ln -sf $PWD/tumblbug-backend.yaml ~/.tmuxp/tumblbug-backend.yaml # tumblbug backend

## Hyper
ln -sf $PWD/.hyper.js ~/.hyper.js

# Restart
source ~/.zshrc
