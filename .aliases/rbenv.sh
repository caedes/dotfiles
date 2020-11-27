# You can pass a Ruby version on first param.
#
# ```bash
# $ rbenvinit 1.9.3-p448
# ```
#
# You can list all Ruby version installed by:
#
# ```bash
# $ rbenv versions
# ```

function rbenvinit () {
  if [ $# -eq 1 ]; then
    echo $1 > .ruby-version
  fi

  echo '.gems' > .rbenv-gemsets
  reload
}
