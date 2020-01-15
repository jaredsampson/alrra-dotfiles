#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_purple_header "Mission Control"

execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
    "Make all Mission Control related animations faster."

execute "defaults write com.apple.dock expose-group-apps -bool true" \
    "Group windows by application in Mission Control"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock spans-displays -bool false" \
    "Disable \"Displays have separate Spaces\""

execute "defaults write com.apple.dock expose-animation-duration -float 0.12" \
    "Speed up Exposé animations"


### Hot Corners ###

# Corners:
#      0: ???
#      1: -
#      2: Mission Control
#      3: Application Windows
#      4: Desktop
#      5: Start Screen Saver
#      6: Disable Screen Saver
#      7: Dashboard
#      8: ???
#      9: ???
#     10: Put Display to Sleep
#     11: Launchpad
#     12: Notification Center

# Modifiers:
#           0: none
#      131072: Shift
#      262144: Control
#      524288: Option
#     1048576: Command

# Top left
execute "defaults write com.apple.dock wvous-tl-corner -int 2 \
    && defaults write com.apple.dock wvous-tl-modifier -int 0" \
    "Hot Corners: Top left = Mission Control"

# Top right
execute "defaults write com.apple.dock wvous-tr-corner -int 4 \
    && defaults write com.apple.dock wvous-tr-modifier -int 0" \
    "Hot Corners: Top right = Desktop"

# Bottom left
execute "defaults write com.apple.dock wvous-bl-corner -int 7 \
    && defaults write com.apple.dock wvous-bl-modifier -int 0" \
    "Hot Corners: Bottom left = Dashboard"

# Bottom right
execute "defaults write com.apple.dock wvous-br-corner -int 10 \
    && defaults write com.apple.dock wvous-br-modifier -int 0" \
    "Hot Corners: Bottom right = Put display to sleep"

killall "Dock" &> /dev/null
