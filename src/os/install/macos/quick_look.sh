#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Quick Look\n\n"

brew_install "Stephen" "qlstephen" "homebrew/cask" "cask"
brew_install "ColorCode" "qlcolorcode" "homebrew/cask" "cask"
brew_install "CSV" "quicklook-csv" "homebrew/cask" "cask"
brew_install "JSON" "quicklook-json" "homebrew/cask" "cask"
brew_install "Markdown" "qlmarkdown" "homebrew/cask" "cask"
