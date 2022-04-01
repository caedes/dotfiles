alias grunt="nocorrect grunt"
alias guard="nocorrect bundle exec guard --no-bundler-warning"
alias gulp="nocorrect gulp"
alias neat="nocorrect neat"
alias oldtop="/usr/bin/top"
alias p="cd $PROJECTS"
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

  # Outdated Brew plugins list
  if type brew > /dev/null; then
    cyan "\nOutdated Brew plugins"
    brew outdated
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
