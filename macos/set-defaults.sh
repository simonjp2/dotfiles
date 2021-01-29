#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

################################################################################
# | Resources:
# | https://ss64.com/osx/defaults.html
# | https://github.com/brandonb927/dotfiles/blob/master/macos.sh
# | https://github.com/mathiasbynens/dotfiles/blob/master/.macos
################################################################################

################################################################################
# | General UI/Ux
################################################################################

# Remove AM/PM from clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE h:mm"

################################################################################
# | Finder
################################################################################

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv` (icon), `clmv` (column), `glvy` (gallery)
defaults write com.apple.finder FXPreferredViewStyle "Nlsv"

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# For home directory, use `PfHm` and `file:///${HOME}/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Don't show these items on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# hide desktop icons
defaults write com.apple.finder CreateDesktop false

# show path bar in finder
defaults write com.apple.finder ShowPathbar -bool false

# show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool false

################################################################################
# | Keyboard, Trackpad (might need to log out and back in)
################################################################################

# Set keyboard repeat and delay
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Trackpad: set fast tracking speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Use F1, F2, etc. keys as standard function keys
# press the Fn key to use the special features
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "functionKeys"


################################################################################
# | Dock
################################################################################

# Disable Launchpad Gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false

# Enable App Expose Gesture (swipe down with three fingers)
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Disable Open application indicators
defaults write com.apple.dock show-process-indicators -bool false

# Don't animate opening applications from the dock
defaults write com.apple.dock launchanim -bool false

# Don't automatically rearraange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Group windows by app in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# Don't show recent apps
defaults write com.apple.dock show-recents -bool false

# Adjust the size of doc icons
defaults write com.apple.dock tilesize -float 50

# Automatically hide the dock
defaults write com.apple.dock autohide -bool true

# Wipe all (default) app icons from Dock
# This is useful when setting up a new Mac, or if you don't use
# Dock to launch apps
# Drag apps to Dock if you want to re-add them
defaults write com.apple.dock persistent-apps -array


################################################################################
# | Menu Extra
################################################################################

# Show battery percent in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


################################################################################
# | Notifications
################################################################################

# Order notifications as Recents by app
defaults write com.apple.ncprefs sort_order -int 1


# Kill affected applications
echo "Kill the affected applications"
for app in "Finder" \
	"Dock" \
	"SystemUIServer"; do
	killall "$app" >/dev/null 2>&1
done
