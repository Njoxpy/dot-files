#!/bin/bash

# Get the absolute path of the dot-files folder
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Deploying Rust-optimized config..."

# 1. Link .vimrc to home
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

# 2. Create CoC folders if they don't exist
mkdir -p "$HOME/.config/coc/snippets"

# 3. Link coc-settings.json
ln -sf "$DOTFILES_DIR/coc/coc-settings.json" "$HOME/.config/coc/coc-settings.json"

# 4. Link ALL snippets (Go, Rust, etc.)
for f in "$DOTFILES_DIR/coc/snippets/"*.json; do
    ln -sf "$f" "$HOME/.config/coc/snippets/$(basename "$f")"
done

# 5. Ensure Rust toolchain components are present
if command -v rustup &> /dev/null; then
    rustup component add rust-analyzer clippy rustfmt
fi

echo "✅ Done! Restart Vim to apply changes."
