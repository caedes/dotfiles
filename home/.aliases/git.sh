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
  gll --date=iso --author="`git config --get user.name`" --since=$SINCE
}

# Undo last commit
function gundo () {
  git reset --soft HEAD~1 &&
  git reset HEAD `git status -s | tr -d 'M' | tr -d '\n'`
}

# List all merged branches on local and remote
function gbclean () {
  ggl &&
  git remote prune origin &&
  git fetch &&
  git branch -a --merged | grep -v -E 'master|stable|staging|pull|'`git rev-parse --abbrev-ref HEAD` | sed 's/^/git branch -d/' | sed 's/branch -d  remotes\/origin\//push origin :/'
}

# Create a feature branch
function gbf () {
  if [ -z "$1" ]; then
    red 'creating feature branch: missing required argument branch name'
  else
    git checkout -b feature/$1
  fi
}

# Create a hotfix branch
function gbh () {
  if [ -z "$1" ]; then
    red 'creating hotfix branch: missing required argument branch name'
  else
    git checkout -b hotfix/$1
  fi
}

# Create a release candidate branch
function gbrc () {
  if [ -z "$1" ]; then
    red 'creating release candidate branch: missing required argument branch name'
  else
    git checkout -b rc/$1
  fi
}

# Create a LEC branch
function gblec () {
  if [ -z "$1" ]; then
    red 'creating LEC branch: missing required argument LEC ticket number'
  else
    if [ -z "$2" ]; then
        red 'creating LEC branch: missing required argument feature name'
    else
      branch=`echo $2 | sed 's/-/_/'`
      git checkout -b lec_$1_$branch
    fi
  fi
}

# Add a tag with a particular version
function gt () {
  if [ -z "$1" ]; then
    red 'gt: missing required argument version number'
  else
    if [[ $1 == v* ]]; then
      TAG=$1
    else
      TAG=v$1
    fi

    git commit -am 'Bump version '$TAG
    ggp
    git tag $TAG
    ggp --tags
  fi
}
