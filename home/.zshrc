# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 bundle)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
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
export PATH="$HOME/.rbenv/bin:$PATH"

export CC=/usr/bin/gcc

export PGHOST=/tmp

# RBENV

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# LOAD nvm COMMAND
. ~/nvm/nvm.sh

export set PATH=$PATH:/usr/local/share/npm/bin

# LOAD ALL ALIASES
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Change dir

if [ -d ~/Documents/dev/ ]; then
  cd ~/Documents/dev/
fi

if [ -d ~/Sites/ ]; then
  cd ~/Sites/
fi

# Add .gitignore_global

if [ -f ~/.gitignore_global ]; then
  git config --global core.excludesfile ~/.gitignore_global
fi
