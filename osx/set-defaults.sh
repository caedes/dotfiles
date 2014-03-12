echo "✓ Always open everything in Finder's list view"
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo "✓ Set a really fast key repeat"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "✓ Hide hidden files by default"
defaults write com.apple.finder AppleShowAllFiles 0

echo "✓ Enable tab switching in modal windows and other keyboard navigation perks"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
