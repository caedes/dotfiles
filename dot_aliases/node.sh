alias ems="ember server"

function share_folder() {
  npx serve "$1" & npx ngrok http 5000
}

function share_app() {
  yarn start & npx ngrok http 3000
}
