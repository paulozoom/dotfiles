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

video-to-gif() {
  ffmpeg \
    -i "$1" \
    -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" \
    -f gif \
    "${1%.*}.gif"
}

gif-to-video() {
  ffmpeg \
    -i "$1" \
    -hide_banner -loglevel warning \
    -movflags faststart \
    -pix_fmt yuv420p \
    -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
    "${1%.*}.mp4"
}

png-to-jpg() {
  convert "$1" "${1%.*}.jpg"
}

png-to-jpg-all() {
  for i in *.png ; do convert "$i" "${i%.*}.jpg" ; done
}
