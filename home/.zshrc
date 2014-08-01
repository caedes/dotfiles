# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

DOTFILES=~/.homesick/repos/dotfiles

PROJECTS=~/Projects/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails brew cloudapp rake-fast)

source $ZSH/oh-my-zsh.sh
if brew list -1 | grep -q "^nvm\$"; then
  source $(brew --prefix nvm)/nvm.sh
fi

export PATH=/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/X11/bin:$PATH
export PATH=/usr/libexec:$PATH
export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH="$HOME/adt-bundle-mac-x86_64/sdk/tools:$PATH"
export PATH="$HOME/adt-bundle-mac-x86_64/sdk/platform-tools:$PATH"
export PATH="./bin:$PATH"

# Current node_modules path
export PATH="./node_modules/.bin:$PATH"

# Rbenv shims path
export PATH="$HOME/.rbenv/shims:$PATH"

export CC=/usr/bin/gcc

export PGHOST=/tmp

export COMPANY=wopata

# LOAD nvm COMMAND

if [ -f ~/nvm/nvm.sh ]; then
  . ~/nvm/nvm.sh
fi

# LOAD SHELL DEPENDENCIES

if [ -f ~/zsh_colors.sh ]; then
    . ~/zsh_colors.sh
fi

# LOAD ALL ALIASES

if [ -f ~/zsh_aliases.sh ]; then
    . ~/zsh_aliases.sh
fi

# Use .localrc for SUPER SECRET CRAP
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# Auto updating dotfiles

if [ -f ~/.dotfiles_update ]; then
    . ~/.dotfiles_update
fi

# DEFAULT DIRECTORY

if [ -f ~/.RELOAD ]; then
  cd $(cat ~/.RELOAD)
  rm ~/.RELOAD
else
  cd $PROJECTS
fi
