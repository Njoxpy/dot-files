# Example .zshrc

# Set PATH for custom binaries (if any)
export PATH="$HOME/bin:$PATH"

# Aliases
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'

# Prompt customization
autoload -U promptinit && promptinit
prompt 'agnoster'  # Use the Agnoster theme (requires Oh My Zsh and Powerline/fonts)

# Editor
export EDITOR='vim'

# History settings
HISTSIZE=1000
HISTFILESIZE=2000

# Plugins
plugins=(git)

# Customize Oh My Zsh theme (if using)
ZSH_THEME="agnoster"

# Initialize Oh My Zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

# Load Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Example custom function
myfunction() {
    echo "Hello, this is a custom function!"
}

# Example setting an environment variable
export AWS_ACCESS_KEY_ID="your_access_key_id"
export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
