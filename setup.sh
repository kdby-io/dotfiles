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


#----------------- fish ------------------
brew install fish
curl -L https://get.oh-my.fish | fish
omf install bass

#-------------- fish theme ---------------
omf install pure
chsh -s $(which fish)
# https://github.com/rafaelrinaldi/pure/wiki/Oh-My-Fish-not-currently-supporting-conf.d-snippets-in-plugins-and-themes
ln -s $OMF_PATH/themes/pure/conf.d/pure.fish ~/.config/fish/conf.d/pure.fish
ln -s $OMF_PATH/themes/pure/conf.d/_pure_init.fish ~/.config/fish/conf.d/pure_init.fish
ln -sf $PWD/fish/config.fish ~/.config/fish/config.fish
ln -sf $PWD/fish/functions/fuck.fish ~/.config/fish/functions/fuck.fish
ln -sf $PWD/fish/functions/nvm.fish ~/.config/fish/functions/nvm.fish
omf theme pure
omf install pj
omf install z

#--------------- thefuck ----------------
brew install thefuck

#---------------- yarn ------------------
brew install yarn

#---------------- neovim ----------------
brew install neovim
mkdir -p ~/.config/nvim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

#----------------- lsd ------------------
brew install lsd

#----------------- hub ------------------
brew install hub