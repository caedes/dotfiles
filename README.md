# dotfiles

My personal dotfiles with [Homesick](https://github.com/technicalpickles/homesick).

## Installation

To get started, install homesick first:

```bash
$ gem install homesick
```

Next, use the homesick command to clone the castle:

```bash
$ homesick clone git://github.com/caedes/dotfiles.git
```

With the castle cloned, link its contents into home dir:

```bash
$ homesick symlink dotfiles
```

## Build GitHub Pages

Powered by [Gulp](https://github.com/gulpjs/gulp).

```bash
$ gulp docs
$ gulp build
```

## Documentation

* [Main ZSH Aliases](zsh_aliases.html)
* [Color ZSH Aliases](zsh_colors.html)
