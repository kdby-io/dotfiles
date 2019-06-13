#!/bin/sh

PWD=`pwd`

#--------------- Homebrew ---------------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


#----------------- tmux -----------------
brew install tmux
git clone https://github.com/tmux-plugins/tpm $PWD/.tmux/plugins/tpm
ln -sf $PWD/.tmux.conf ~/.tmux.conf


#---------------- neovim ----------------
brew install neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim


#----------------- lsd ------------------
brew install lsd


#----------------- zsh ------------------
brew install zsh zsh-completions


#-------------- oh-my-zsh ---------------
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $PWD/.zshrc ~/.zshrc

# spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


## thefuck
brew install thefuck


source ~/.zshrc
echo "Done! Reopen a terminal";
