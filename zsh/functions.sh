#! /usr/env/bin zsh
function cdp() {
  cd "$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
}

function gnome-customize() {
  gsettings set org.gnome.desktop.interface enable-animations false
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape', 'altwin:swap_alt_win']"
}

function gnome-reset() { 
  gsettings set org.gnome.desktop.interface enable-animations true
  gsettings set org.gnome.desktop.input-sources xkb-options "[]"
}

function add-make() {
  cp ~/wte/dotfiles/templates/Makefile .
}

function add-npmrc() {
  cp ~/wte/dotfiles/templates/.npmrc .
}

function add-editorconfig() {
  cp ~/wte/dotfiles/templates/.editorconfig .
}

function add-nugetconfig() {
  cp ~/wte/dotfiles/templates/NuGet.config .
}

function add-prettierrc() {
  # add to package.json dev
  # add format script
  cp ~/wte/dotfiles/templates/.prettierrc .
}
