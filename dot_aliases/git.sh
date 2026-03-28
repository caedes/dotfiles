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
  if [ -z "$1" ] || [ -z "$2" ]; then
    red 'usage: gbf <id> <description>'
  else
    local suffix=$(format_branch_name "$1" "$2")
    git checkout -b "${GIT_BRANCH_FEATURE}/${suffix}"
  fi
}

# Create a hotfix branch
function gbh () {
  if [ -z "$1" ] || [ -z "$2" ]; then
    red 'usage: gbh <id> <description>'
  else
    local suffix=$(format_branch_name "$1" "$2")
    git checkout -b "${GIT_BRANCH_HOTFIX}/${suffix}"
  fi
}
