alias ems="ember server"
alias n="npm"
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"

function share_folder() {
  npx serve "$1" & npx ngrok http 5000
}

function share_app() {
  yarn start & npx ngrok http 3000
}
