alias thin="nocorrect thin"
alias thor="nocorrect thor"
alias npm="nocorrect npm"
alias grunt="nocorrect grunt"
alias guard="nocorrect bundle exec guard --no-bundler-warning"
alias neat="nocorrect neat"
alias rspec="nocorrect rspec"
alias reload="echo \`pwd\` > ~/.RELOAD && source ~/.zshrc"
alias pk='nocorrect pk'
alias reek='nocorrect reek -n -c ~/.reek'
alias gulp="nocorrect gulp"

function update () {
  # Upgrade dotfiles
  cyan "\nDotfiles..."
  dotfiles && ggl &&
  homesick symlink dotfiles
  green "Dotfiles updated.\n"

  # Set OS X defaults
  cyan "Default OSX config..."
  $DOTFILES/osx/set-defaults.sh
  green "Default OSX config updated.\n"

  # Upgrade heroku toolbelt
  cyan "\nHeroku..."
  heroku update
  green "Heroku updated.\n"

  # Upgrade Atom plugins
  if type atom > /dev/null; then
    cyan "\nAtom plugins..."
    apm upgrade
    green "Atom plugins updated.\n"
  fi


  if [ -z "$1" ]; then
    cyan "\nReload..."
    reload
  fi
}

alias top="vtop --theme monokai"
alias oldtop="/usr/bin/top"
