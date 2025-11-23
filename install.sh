#!/bin/bash

# --- Dotfiles Deployment Script ---

# Define the source directory (where this script is located)
DOTFILES_DIR=$(pwd)

# 1. Create Symlink for .vimrc
echo "Linking .vimrc..."
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc

# 2. Create directory structure for CoC configs
echo "Creating ~/.config/coc/ structure..."
mkdir -p ~/.config/coc/snippets/

# 3. Symlink CoC configuration file
echo "Linking coc-settings.json..."
ln -sf $DOTFILES_DIR/coc/coc-settings.json ~/.config/coc/coc-settings.json

# 4. Symlink CoC Go Snippets (adjust file name if you used .go.json)
echo "Linking Go snippets..."
ln -sf $DOTFILES_DIR/coc/snippets/go.json ~/.config/coc/snippets/go.json

echo "Deployment complete! Run vim +PluginInstall."
