#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_purple_header "Dashboard"

execute "defaults write com.apple.dashboard db-enabled-state -int 3" \
    "Show the Dashboard as an overlay"

killall "Dashboard" &> /dev/null
