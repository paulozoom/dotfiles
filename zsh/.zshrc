# Load Antigen
source $(brew --prefix)/share/antigen/antigen.zsh
# Load the oh-my-zsh library
antigen use oh-my-zsh
# Theme
antigen theme robbyrussell
# Standard plugins
antigen bundle git
antigen bundle bundler
antigen bundle npm
antigen bundle rbenv
antigen bundle fasd
# https://github.com/lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-nvm
# Apply antigen settings
antigen apply

# Use VSCode over vim unless on SSH
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code --wait'
fi

# Aliasases for Mac apps
alias imageoptim='open -a ImageOptim'
alias yoink='open -a Yoink'
