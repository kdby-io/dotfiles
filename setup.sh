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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#
# Oh my zsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh theme
brew install pure
echo -e "\nautoload -U promptinit; promptinit" >> ~/.zshrc
echo -e "\nprompt pure" >> ~/.zshrc

# ----------------- tmux -----------------
# brew install tmux
# git clone https://github.com/tmux-plugins/tpm ./.tmux/plugins/tpm
# ln -sf $PWD/.tmux.conf ~/.tmux.conf


#--------------- thefuck ----------------
brew install thefuck
eval $(thefuck --alias)

#--------------- asdf.vm ----------------
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

#---------------- yarn ------------------
brew install yarn

#---------------- neovim ----------------
brew install neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

#----------------- lsd ------------------
brew install lsd

