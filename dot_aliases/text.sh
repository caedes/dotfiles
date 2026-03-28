alias flip='echo -n "(╯°□°）╯︵ ┻━┻" | LANG=en_US.UTF-8 pbcopy'
alias fu='echo -n "┌∩┐(◣_◢)┌∩┐" | LANG=en_US.UTF-8 pbcopy'
alias lod='echo -n ಠ_ಠ | LANG=en_US.UTF-8 pbcopy'
alias lol="say -v Hysterical 'haaa haha'"
alias week='date +"%V"'
alias zzz='echo -n "(￣o￣) zzZZzzZZ" | LANG=en_US.UTF-8 pbcopy'

GIT_BRANCH_FEATURE="feature"
GIT_BRANCH_HOTFIX="hotfix"

function _format_branch_segment() {
  echo "$1" | \
    tr '[:upper:]' '[:lower:]' | \
    sed 'y/àâéèêëîïôûùç/aaeeeeiiouuc/' | \
    sed 's/[^a-z0-9]/-/g' | \
    sed 's/-\{2,\}/-/g' | \
    sed 's/^-//;s/-$//'
}

function format_branch_name() {
  local id=$(_format_branch_segment "$1")
  local desc=$(_format_branch_segment "$2")
  echo "${id}-${desc}"
}
