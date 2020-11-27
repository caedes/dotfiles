# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Spaceship prompt configuration
SPACESHIP_BATTERY_THRESHOLD=50

DOTFILES=~/.homesick/repos/dotfiles

PROJECTS=~/Projects/

plugins=(brew cloudapp git gitignore git-flow-completion rails rake-fast yarn-autocompletions)

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
if brew list --formula -1 | grep -q "^nvm\$"; then
  source $(brew --prefix nvm)/nvm.sh
fi

export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH=/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/X11/bin:$PATH
export PATH=/usr/libexec:$PATH
export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="`yarn global bin`:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./bin:$PATH"

export CC=/usr/bin/gcc

export PGHOST=/tmp

export ANDROID_HOME=/usr/local/Caskroom/android-sdk/3859397,26.0.2

eval "$(rbenv init -)"

alias reload="source ~/.zshrc && cd -"

# LOAD SHELL ALIASES

. ~/.aliases/colors.sh # Must be first included
. ~/.aliases/archive.sh
. ~/.aliases/chrome.sh
. ~/.aliases/editor.sh
. ~/.aliases/git.sh
. ~/.aliases/heroku.sh
. ~/.aliases/ip.sh
. ~/.aliases/mongo.sh
. ~/.aliases/node.sh
. ~/.aliases/path.sh
. ~/.aliases/pg.sh
. ~/.aliases/rails.sh
. ~/.aliases/rbenv.sh
. ~/.aliases/ssh.sh
. ~/.aliases/text.sh
. ~/.aliases/zsh.sh

# Use .localrc for SUPER SECRET CRAP
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# Auto updating dotfiles

if [ -f ~/.dotfiles_update ]; then
    . ~/.dotfiles_update
fi

# DEFAULT DIRECTORY

cd $PROJECTS
