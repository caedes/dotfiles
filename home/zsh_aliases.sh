# # ZSH Aliases

# ## GIT

# Classico aliases
alias gst="git status -sb"
alias gds="git diff --staged"
alias gaa="ga . -N"
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gm="git merge"
alias gap="git add --patch"

# Fix oh-my-zsh's git plugin
if type gclean > /dev/null; then
  unalias gclean
fi

# Git Submodule
alias gsync="git fetch upstream && git merge upstream/master && ggpnp"

# Git Stash
alias gss="git stash save"
alias gsl="git stash list"
function gsa () {
  if [ -z "$1" ]; then
    STASH=0
  else
    STASH=$1
  fi
  git stash apply stash@{$STASH}
}

# Pretty git logs
alias gll="git log --pretty=format:'%C(yellow)%h %C(cyan)%ad %Creset%s%Cred [%cn]' --decorate --date=short"

# All commits since a particular date
function timesheet () {
  if [ -z "$1" ]; then
    SINCE="8am"
  else
    SINCE=$1
  fi
  git log --oneline --author="`git config --get user.name`" --since=$SINCE
}

# Undo last commit
function gundo () {
  git reset --soft HEAD~1 &&
  git reset HEAD `git status -s | tr -d 'M' | tr -d '\n'`
}

# List all merged branches on local and remote
function gbclean () {
  ggpull &&
  git remote prune origin &&
  git fetch &&
  git branch -a --merged | grep -v -E 'master|stable|staging|pull|'`git rev-parse --abbrev-ref HEAD` | sed 's/^/git branch -d/' | sed 's/branch -d  remotes\/origin\//push origin :/'
}

# Create a feature branch
function gbf () {
  if [ -z "$1" ]; then
    red 'creating feature branch: missing required argument branch name'
  else
    git checkout -b feature_$1
  fi
}

# Create a hotfix branch
function gbh () {
  if [ -z "$1" ]; then
    red 'creating hotfix branch: missing required argument branch name'
  else
    git checkout -b hotfix_$1
  fi
}

# Create a release candidate branch
function gbrc () {
  if [ -z "$1" ]; then
    red 'creating release candidate branch: missing required argument branch name'
  else
    git checkout -b rc_$1
  fi
}

# Add a tag with a particular version
function gtag () {
  if [ -z "$1" ]; then
    red 'bumping version: missing required argument version number'
  else
    git commit -am 'Bump version v'$1
    git tag v$1
    ggpush --tags
  fi
}

# ## SPORK

alias td="nocorrect testdrb -Itest"

# ## RAILS

alias t="ruby -Itest"
alias fs="foreman start"
alias fsd="foreman start -f Procfile.development"
alias sss="RAILS_ENV=test rake sunspot:solr:start"
alias frc="foreman run rails console"
alias frg="foreman run guard --no-bundler-warning"
alias bi="bundle install"
alias migrate="rdm && rdtp"

# ## RBENV

# You can pass a Ruby version on first param.
#
# ```bash
# $ rbenvinit 1.9.3-p448
# ```
#
# You can list all Ruby version installed by:
#
# ```bash
# $ rbenv versions
# ```

function rbenvinit () {
  if [ $# -eq 1 ]; then
    echo $1 > .ruby-version
  fi

  echo `basename $PWD` > .rbenv-gemsets
  reload
  gem install bundler --pre && bundle -j4
}

# ## NPM

function nvminit () {
  if [ -z "$1" ]; then
    NODE_VERSION='0.10'
  else
    NODE_VERSION=$1
  fi

  echo $NODE_VERSION > .nvmrc

  npm i
}

# ## POSTGRESQL

function resetdb () {
  if [ -z "$1" ]; then
    red 'resetdb: missing required argument database name'
  else
    dropdb $1 && createdb $1
  fi
}

function restoredb () {
  if [ -z "$1" ]; then
    red 'restoredb: missing required argument database name'
  else
    if [ -z "$2" ]; then
      red 'restoredb: missing required argument dump file'
    else
      pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $1 $2
    fi
  fi
}

function dumpdb () {
  if [ -z "$1" ]; then
    red 'dumpdb: missing required argument database name'
  else
    if [ -z "$2" ]; then
      red 'dumpdb: missing required argument dump file'
    else
      pg_dump -Fc $1 > $2_`date +%Y%m%d%H%M%S`.dump
    fi
  fi
}

function hedumpdb () {
  if [ -z "$1" ]; then
    red 'hedumpdb: missing required argument app name'
  else
    heroku pgbackups:capture --expire --app $1
    now=`date +%Y%m%d%H%M%S`
    backup_url=`heroku pgbackups:url --app $1`
    echo "curl -o $1_$now.dump $backup_url" | pbcopy
    green 'curl dump copy in clipboard'
  fi
}

# ## ZSH

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

# ## SSH

alias myssh="pbcopy < ~/.ssh/id_rsa.pub"

# ## IP

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias myip="localip"

# ## ARCHIVE

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     yellow "'$1' cannot be extracted via extract()" ;;
    esac
  else
    red "'$1' is not a valid file"
  fi
}

# ## PATH

alias l.='ls -ld .*'
alias dotfiles="cd $DOTFILES"
alias ll='ls -hl'
alias duh="du -h . | grep '\./[^/]*$'"
alias rmlogs='find /Users -type f -iwholename "*log/test.log"  -o -iwholename "*log/production.log" -o -iwholename "*log/development.log" | xargs rm -f'

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function tree() {
  if [ -z "$1" ]; then
    red 'tree: missing required folder'
  else
    find $1 -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  fi
}

# ## HEROKU

alias he="heroku"

function deploy () {
  if [ -z "$1" ]; then
    red 'deploy: missing required branch'
  elif [ -z "$2" ]; then
    red 'deploy: missing required app'
  else
    gco $1 &&
    ggpnp &&
    heroku maintenance:on --app $2 &&
    gp $2 $1:master
    if [ -f ./Rakefile ]; then
      heroku run rake db:migrate --app $2
    fi
    heroku maintenance:off --app $2 &&
    heroku open --app $2
  fi
}

# ## CURL

function get() {
  curl -b /tmp/.curl_cookie -c /tmp/.curl_cookie "$@"
}

function post() {
  get -d "$@"
}

function put() {
  get -X PUT -d "$@"
}

function delete() {
  get -X DELETE "$@"
}

# ## UPDATE

function update () {
  # Upgrade dotfiles
  cyan "\nDotfiles..."
  dotfiles && ggpull &&
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

# ## XCODE

alias ios="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

# ## CLICKATELL

alias sms="nocorrect sms"

# ## CHROME

alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# ## MACOSX

alias shf="defaults write com.apple.finder AppleShowAllFiles 1"
alias hhf="defaults write com.apple.finder AppleShowAllFiles 0"

# ## GRUNT

function gi() {
  npm i -S grunt-"$@"
}

function gci() {
  npm i -S grunt-contrib-"$@"
}

# ## GULP

alias gulp="nocorrect gulp"
