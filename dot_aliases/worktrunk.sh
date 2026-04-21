# Worktrunk aliases
# https://worktrunk.dev/

alias wl='wt list'
alias wsd='wt switch develop'

# Create a feature branch with worktrunk
function wtc () {
  local type="$GIT_BRANCH_FEATURE"
  if [ "$1" = "--fix" ]; then
    type="$GIT_BRANCH_HOTFIX"
    shift
  fi

  if [ -z "$1" ] || [ -z "$2" ]; then
    red "usage: wtc [--fix] <id> <description> [<base=develop>]"
    return 1
  fi

  local branch_name="${type}/$(format_branch_name "$1" "$2")"
  local base="${3:-develop}"

  wt switch --create "$branch_name" --base "$base"
}
