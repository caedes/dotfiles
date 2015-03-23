alias he="heroku"

function deploy () {
  if [ -z "$1" ]; then
    red 'deploy: missing required branch'
  elif [ -z "$2" ]; then
    red 'deploy: missing required app'
  else
    gco $1 &&
    ggpnp &&
    heroku maintenance:on --app $2 &&
    gp $2 $1:master
    if [ -f ./Rakefile ]; then
      heroku run rake db:migrate --app $2
    fi
    heroku maintenance:off --app $2 &&
    heroku open --app $2
  fi
}
