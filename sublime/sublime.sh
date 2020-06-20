#!/usr/bin/env bash

export SUBLIME_PATH="$HOME/Library/Application Support/Sublime Text 3"

# Create Sublime Text directories if they don't exist
[ -d "$SUBLIME_PATH/Installed Packages/Package" ] || mkdir -p "$SUBLIME_PATH/Installed Packages/Package"
[ -d "$SUBLIME_PATH/Packages" ] || mkdir -p "$SUBLIME_PATH/Packages"

# Install Package Control
wget -O "$SUBLIME_PATH/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package";

# Create symbolic link to the preferences in the dotfiles repository
ln -s "$HOME/dotfiles/sublime/User" "$SUBLIME_PATH/Packages/User"

# Create symlink to subl command if already exists
SUBL="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
if [ -f $SUBL ]
    ln -s $SUBL /usr/local/bin/subl
fi

