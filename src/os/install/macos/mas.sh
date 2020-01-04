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
    else
        return 0
    fi

    # Wait until Homebrew is installed.
    execute \
        "until homebrew_is_installed; do \
            sleep 5; \
         done" \
        "Install Homebrew"
}

mas_is_installed() {
    mas &> /dev/null
}

install_mas() {

    # If necessary, install `mas`.
    if ! mas_is_installed; then
        brew_install "mas" "mas"
    else
        return 0
    fi

    # Wait until `mas` is installed.
    execute \
        "until mas_is_installed; do \
            sleep 5; \
         done" \
        "Install mas"
}

is_signed_into_app_store() {
    mas account &> /dev/null
}

signin_to_app_store() {

    # If necessary, prompt user to sign into the App Store.
    if ! is_signed_into_app_store; then
        open -a "App Store"
    else
        return 0
    fi

    # Wait until signed in
    execute \
        "until is_signed_into_app_store; do \
             sleep 5; \
         done" \
        "Signin to App Store"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "   Mac App Store\n\n"

    install_homebrew
    install_mas
    signin_to_app_store
    brew bundle -v --no-lock --file=Brewfile-mas
}

main
