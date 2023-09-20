# Classico aliases
alias gc="npx git-cz"
alias gloc="git ls-files | xargs cat | wc -l"
alias gitit="git init && git commit -m 'initial commit' --allow-empty"

# Git Submodule
alias gsync="git fetch upstream && git merge upstream/master && ggpnp"

# Undo last commit
function gundo () {
  git reset --soft HEAD~1 &&
  git reset .
}

# Clean branches on local and remote
function gbclean () {
  gcm &&
  ggl &&
  git fetch --all &&
  git remote prune origin &&
  gb -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs gb -d
}

# Create a feature branch
function gbf () {
  if [ -z "$1" ]; then
    red 'creating feature branch: missing required argument branch name'
  else
    branch=`echo $1 | sed 's/-/_/g'`
    git checkout -b feature/$branch
  fi
}

# Create a release branch
function gbrelease () {
  if [ -z "$1" ]; then
    red 'creating release branch: missing required argument branch name'
  else
    branch=`echo $1 | sed 's/-/_/g'`
    git checkout -b release/$branch
  fi
}

# List Git Authors by commits number
alias gauth="git shortlog -s -n --all --no-merges"
