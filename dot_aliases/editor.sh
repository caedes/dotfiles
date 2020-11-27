alias c="code ."

function meeting() {
  cd ~/Projects/cdiscount/meetings
  TODAY="$(date +%Y-%m-%d)"
  if [ -z "$1" ]; then
    echo "# $TODAY" > "$TODAY.md"
    code . -g "$TODAY.md"
  else
    echo "# $TODAY $1" > "$TODAY-$1.md"
    code . -g "$TODAY-$1.md"
  fi
}
