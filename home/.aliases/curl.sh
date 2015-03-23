function get() {
  curl -b /tmp/.curl_cookie -c /tmp/.curl_cookie "$@"
}

function post() {
  get -d "$@"
}

function put() {
  get -X PUT -d "$@"
}

function delete() {
  get -X DELETE "$@"
}
