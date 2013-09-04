#bin/sh
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

if [ ! -f ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package ]; then
  curl 'https://sublime.wbond.net/Package%20Control.sublime-package' > ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package
fi

rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

ln -s ~/.homesick/repos/dotfiles/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/.homesick/repos/dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
