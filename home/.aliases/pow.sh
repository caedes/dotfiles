function powit() {
  if [ -z "$1" ]; then
    echo 'Using default port 5000'
    port=5000
  else
    port=$1
  fi

  if [ -z "$2" ]; then
    echo 'Using basename as domain : '`basename $PWD`
    domain=`basename $PWD`
  else
    domain=$2
  fi

  echo $port > ~/.pow/$domain

  echo "localhost:$port > $domain.dev"
}

function powrestart() {
  touch ~/.pow/restart.txt
}
