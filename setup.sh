#!/bin/sh

PWD=`pwd`

echo "$(tput setaf 2)Greetings.$(tput sgr 0)"

#--------------- Homebrew ---------------
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "$(tput setaf 2)Homebrew is already installed.$(tput sgr 0)"
else
  echo "$(tput setaf 3)Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


#----------------- tmux -----------------
brew install tmux
git clone https://github.com/tmux-plugins/tpm ./.tmux/plugins/tpm
ln -sf $PWD/.tmux.conf ~/.tmux.conf


#----------------- zsh ------------------
brew install zsh

#-=------------- thefuck ----------------
brew install thefuck

#---------------- neovim ----------------
brew install neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

#----------------- lsd ------------------
brew install lsd

#------------------ z -------------------
brew install z

#-------------- oh-my-zsh ---------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "$(tput setaf 3)Installing oh-my-zsh.$(tput sgr 0)"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "$(tput setaf 2)oh-my-zsh already installed.$(tput sgr 0)"
fi
ln -sf $PWD/.zshrc ~/.zshrc


# spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes/spaceship-prompt
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s $(which zsh)

source ~/.zshrc


#---------------- hyper -----------------
brew update
brew cask install hyper

echo "$(tput setaf 2)Enjoy :)$(tput sgr 0)"
