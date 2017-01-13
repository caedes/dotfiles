echo "✓ Always open everything in Finder's list view"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo "✓ Set a really fast key repeat"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "✓ Hide hidden files by default"
defaults write com.apple.finder AppleShowAllFiles 0

echo "✓ Enable tab switching in modal windows and other keyboard navigation perks"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "✓ Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock
