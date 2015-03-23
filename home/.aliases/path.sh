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
