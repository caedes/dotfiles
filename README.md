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

### Bundle

`bi` bundle install

`bu` bundle update

`be` bundle exec

### Git

`gds` git diff staged files

`gaa` git add all files

`timesheet` list my own commits

### bin

`subl` launch SublimeText

### Spork

`td` run rspec test file

### Rails

`t` run test::unit file

`sc` run console for Rails 2

### SSH

`myssh` add public key in clipboard

### IP

`myip` display my local IP

### archive

`extract` extract most know archives with one command

### path

`mcd` make and cd into directory

`l.` show hidden files only

### Heroku

`he` heroku

### cURL

`get` send a cURL GET request

`post` send a cURL POST request

`put` send a cURL PUT request

`delete` send a cURL DELETE request
