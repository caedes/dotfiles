function resetdb () {
  if [ -z "$1" ]; then
    red 'resetdb: missing required argument database name'
  else
    dropdb $1 && createdb $1
  fi
}

function restoredb () {
  if [ -z "$1" ]; then
    red 'restoredb: missing required argument database name'
  else
    if [ -z "$2" ]; then
      red 'restoredb: missing required argument dump file'
    else
      pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $1 $2
    fi
  fi
}

function dumpdb () {
  if [ -z "$1" ]; then
    red 'dumpdb: missing required argument database name'
  else
    if [ -z "$2" ]; then
      red 'dumpdb: missing required argument dump file'
    else
      pg_dump -Fc $1 > $2_`date +%Y%m%d%H%M%S`.dump
    fi
  fi
}

function hedumpdb () {
  if [ -z "$1" ]; then
    red 'hedumpdb: missing required argument app name'
  else
    heroku pg:backups capture --app $1
    now=`date +%Y%m%d%H%M%S`
    backup_url=`heroku pg:backups public-url --app $1`
    echo "curl -o $1_$now.dump $backup_url" | pbcopy
    green 'curl dump copy in clipboard'
  fi
}
