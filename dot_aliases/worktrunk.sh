# Worktrunk aliases
# https://worktrunk.dev/

alias wl='wt list'
alias wsd='wt switch develop'

# Create a feature branch with worktrunk
function wc () {
  local type="features"
  if [ "$1" = "--fix" ]; then
    type="fixes"
    shift
  fi

  if [ -z "$1" ] || [ -z "$2" ]; then
    red "usage: wc [--fix] <jira_ticket> <feature_name>"
    return 1
  fi

  local ticket=$(format_branch_name "$1")
  local name=$(format_branch_name "$2")
  local branch_name="${type}/${ticket}_${name}"

  wt switch --create "$branch_name" --base develop
}
