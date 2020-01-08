#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

homebrew_is_installed() {
    brew -h &> /dev/null
}

install_homebrew() {

    # If necessary, install Homebrew.
    if ! homebrew_is_installed; then
        ./homebrew.sh
    fi

    # Wait until Homebrew is installed.
    execute \
        "until homebrew_is_installed; do \
            sleep 5; \
         done" \
        "Install Homebrew"
}


setapp_is_installed() {
    [ -d "/Applications/Setapp.app" ]
}

get_setapp_version() {
    brew cask info setapp | grep "setapp:" | awk '{print $2}'
}

finish_setapp_installation() {

    local version=$(get_setapp_version)
    local installer="/usr/local/Caskroom/setapp/$version/Install Setapp.app"

    if ! [ setapp_is_installed ]; then
        if [ -d "$installer" ]; then
            open "$installer"
        fi
    fi

    execute \
        "until setapp_is_installed; do \
            sleep 5; \
         done" \
        "Finish Setapp installation"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "   Casks\n\n"

    install_homebrew
    brew bundle --no-lock --file=Brewfile-casks

    finish_setapp_installation

}

main
