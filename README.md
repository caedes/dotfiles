# dotfiles

My personal dotfiles with [Homesick](https://github.com/technicalpickles/homesick).

## Install

To get started, install homesick first:

```shell
gem install homesick
```

Next, use the homesick command to clone the castle:

```shell
homesick clone git://github.com/caedes/dotfiles.git
```

With the castle cloned, link its contents into home dir:

```shell
homesick symlink dotfiles
```

## Documentation

### Alias

```shell
# BUNDLE

bi #bundle install
bu # bundle update
be # bundle exec

# GIT

gds  # git diff staged files
gaa  # git add all files

# BIN

subl # launch SublimeText

# POSTGRES

pg_start # start pgsql server
pg_stop # stop pgsql server

# MySQL

mysqlstart # start mysql server
mysqlstop # stop mysql server

# SPORK

td # run rspec test file

# RAILS

t # run test::unit file
sc # run console for Rails 2

# SSH

pubkey # add public key in clipboard

# ARCHIVE

extract # extract most know archives with one command

# PATH

mcd # make and cd into directory

l. # show hidden files only
```
