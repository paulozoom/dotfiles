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
