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

# Undo last commit
function gundo () {
  git reset --soft HEAD~1 &&
  git reset .
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
    branch=`echo $1 | sed 's/-/_/g'`
    git checkout -b feature/$branch
  fi
}

# Create a hotfix branch
function gbh () {
  if [ -z "$1" ]; then
    red 'creating hotfix branch: missing required argument branch name'
  else
    branch=`echo $1 | sed 's/-/_/g'`
    git checkout -b hotfix/$branch
  fi
}

# Create a release candidate branch
function gbrc () {
  if [ -z "$1" ]; then
    red 'creating release candidate branch: missing required argument branch name'
  else
    branch=`echo $1 | sed 's/-/_/g'`
    git checkout -b rc/$branch
  fi
}
