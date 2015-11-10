function hedumpmongo () {
  if [ -z "$1" ]; then
    red 'hedumpmongo: missing required argument app name'
  else
    mongo_uri=`he config:get MONGOLAB_URI -a $1`
    echo $mongo_uri
    protocol_auth=$(echo $mongo_uri | cut -d'@' -f 1)
    he_path=$(echo $mongo_uri | cut -d'@' -f 2)
    host=$(echo $he_path | cut -d'/' -f 1)
    db=$(echo $he_path | cut -d'/' -f 2)
    fucked_user=$(echo $protocol_auth | cut -d':' -f 2)
    user=$(echo $fucked_user | cut -c3-100)
    password=$(echo $protocol_auth | cut -d':' -f 3)
    now=`date +%Y%m%d%H%M%S`
    echo "mongodump -h $host -d $db -u $user -p $password -c docs -o $1_$now.dump" | pbcopy
    green 'mongodump copy in clipboard'
  fi
}
