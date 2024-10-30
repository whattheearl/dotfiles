#! /usr/env/bin zsh
function cdp() {
  cd "$(find ~ -maxdepth 2 -type d -path '/home/jon/wte/**' -or -path '/home/jon/tyl/**' -not -path '*/.cache*' | fzf)"
}

function caps-to-control() {
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
  setxkbmap -option caps:ctrl_modifier 
}

function caps-to-esc() {
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
  setxkbmap -option caps:ctrl_modifier  
}

function swap-alt-win() {
  gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:swap_alt_win']"
}

function add-make() {
  cp ~/wte/docs/templates/Makefile .
}

function add-npmrc() {
  cp ~/wte/docs/templates/.npmrc .
}

function add-editorconfig() {
  cp ~/wte/docs/templates/.editorconfig .
}

function add-nugetconfig() {
  cp ~/wte/docs/templates/NuGet.config .
}

function add-prettierrc() {
  # add to package.json dev
  # add format script
  cp ~/wte/docs/templates/.prettierrc .
}
