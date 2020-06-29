#!/bin/sh

echo " > Starting Mac OSX Configuration..."


################################################################################
# SSH KEY
################################################################################
if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo "There is no SSH public key here: $HOME/.ssh/id_rsa.pub."
    while true; do
        read -p "Do you still want to continue? [Y/n]" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit 1;;
            * ) echo "Invalid input. Please enter yes or no.";;
        esac
    done
else
    echo "SSH public key exists here $HOME/.ssh/id_rsa.pub, so we continue!"
fi

################################################################################
# XCODE
################################################################################

echo " > Installing xcode-stuff..."
##################################
# Install command line dev tools #
##################################
/usr/bin/xcode-select -p > /dev/null 2>&1
if [ $? != 0 ]; then
    xcode-select --install
fi


################################################################################
# HOMEBREW
################################################################################

# Check for Homebrew, install it if we don't have it
if test ! $(which brew); then
    echo " > Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew doctor || exit 1
fi

echo " > Updating homebrew..."
brew update

brew upgrade

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo " > Installing brew packages and cask applications..."
brew bundle --file="$HOME/dotfiles/osx/Brewfile"

echo " > Brew cleanup..."
brew cask cleanup
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish


################################################################################
# ZSH
################################################################################

echo " > Install ZSH"
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm "$HOME"/.zshrc "$HOME"/.zprofile
ln -s "$HOME"/dotfiles/.zshrc "$HOME"/.zshrc
ln -s "$HOME"/dotfiles/.zprofile "$HOME"/.zprofile


################################################################################
# OTHER CONFIG
################################################################################

echo " > Git config..."
git config --global user.name "Daniele Foroni"
git config --global user.email "daniele.foroni@gmail.com"
ln -s "$HOME"/dotfiles/.gitconfig "$HOME"/.gitconfig
ln -s "$HOME"/dotfiles/.gitignore "$HOME"/.gitignore

echo " > Vim config..."
ln -s "$HOME"/dotfiles/.vimrc "$HOME"/.vimrc
ln -s "$HOME"/dotfiles/.editorconfig "$HOME"/.editorconfig
ln -s "$HOME"/dotfiles/.vim "$HOME"/.vim

echo " > Tmux config..."
ln -s "$HOME"/dotfiles/.tmux.conf "$HOME"/.tmux.conf

echo " > Adding custom binaries..."
ln -s "$HOME"/dotfiles/bin "$HOME"/bin

echo " > Sublime Text installation..."
sh "$HOME"/dotfiles/sublime/sublime.sh

echo " > Adding SSH config..."
mkdir -p "$HOME"/.ssh/
ln -s "$HOME"/dotfiles/.ssh/config "$HOME"/.ssh/config

echo " > Python updates..."
pip install --upgrade setuptools
pip install --upgrade pip
pip install wheel virtualenv jupyterlab

################################################################################
# MAC CONFIG
################################################################################

sh "$HOME"/dotfiles/osx/osx-defaults.sh

echo " > Processing completed!"
echo " > Enjoy your fresh-new setup!"

