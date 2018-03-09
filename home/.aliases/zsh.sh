alias grunt="nocorrect grunt"
alias guard="nocorrect bundle exec guard --no-bundler-warning"
alias gulp="nocorrect gulp"
alias neat="nocorrect neat"
alias oldtop="/usr/bin/top"
alias pk='nocorrect pk'
alias reek='nocorrect reek -n -c ~/.reek'
alias rspec="nocorrect rspec"
alias thin="nocorrect thin"
alias thor="nocorrect thor"
alias top="vtop --theme monokai"

function update () {
  # Upgrade dotfiles
  cyan "\nDotfiles..."
  dotfiles && ggl &&
  bundle exec homesick symlink dotfiles
  green "Dotfiles updated.\n"

  # Set OS X defaults
  cyan "Default OSX config..."
  $DOTFILES/osx/set-defaults.sh
  green "Default OSX config updated.\n"

  # Upgrade heroku toolbelt
  cyan "\nHeroku..."
  brew upgrade heroku-toolbelt
  green "Heroku updated.\n"

  # Update Brew list plugins
  if type brew > /dev/null; then
    cyan "\nBrew plugins list update..."
    brew update
    green "Brew plugins list updated.\n"
  fi

  if [ -z "$1" ]; then
    cyan "\nReload..."
    reload
  fi
}

function cleanup () {
  # Clean Brew former plugins
  if type brew > /dev/null; then
    cyan "\nBrew clean..."
    brew cleanup
    green "Brew cleaned.\n"
  fi

  # Clean Yarn cache folder
  if type yarn > /dev/null; then
    cyan "\nYarn cache cleanup..."
    yarn cache clean
    green "Yarn cache cleaned.\n"
  fi
}
