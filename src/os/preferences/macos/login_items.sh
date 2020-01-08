#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_purple_header "Login Items"

execute "osascript -e 'tell application \"System Events\" to delete every login item'" \
    "Clear Login Items list."

execute "osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"/Applications/DelayedLauncher.app\", hidden:true}'" \
    "Add DelayedLauncher to Login Items."
