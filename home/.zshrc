COMPLETION_WAITING_DOTS='true'

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
plugins=(git rails bundler brew cloudapp)

source $ZSH/oh-my-zsh.sh

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
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/adt-bundle-mac-x86_64/sdk/tools:$PATH"

export CC=/usr/bin/gcc

export PGHOST=/tmp

export COMPANY=wopata

# LOAD nvm COMMAND

if [ -f ~/nvm/nvm.sh ]; then
  . ~/nvm/nvm.sh
fi

# LOAD SHELL DEPENDENCIES

if [ -f ~/.zsh_colors ]; then
    . ~/.zsh_colors
fi

# LOAD ALL ALIASES

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
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
