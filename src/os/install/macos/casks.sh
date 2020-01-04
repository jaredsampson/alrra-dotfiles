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

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "   Casks\n\n"

    install_homebrew
    brew bundle --no-lock --file=Brewfile-casks

}

main
