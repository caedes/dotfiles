# Worktrunk aliases
# https://worktrunk.dev/

alias wsd='wt switch develop'

# Create a feature branch with worktrunk
function wc () {
  wt switch --create "features/$1" --base develop
}
