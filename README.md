# dotfiles

[![license](https://img.shields.io/github/license/caedes/dotfiles.svg?maxAge=2592000?style=plastic)](LICENSE.md)
[![Beerpay](https://img.shields.io/beerpay/hashdog/scrapfy-chrome-extension.svg?maxAge=2592000)](https://beerpay.io/caedes/dotfiles)
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social&maxAge=2592000)](https://twitter.com/caedes)

My personal dotfiles with [Homesick](https://github.com/technicalpickles/homesick).

## Installation

To get started, install homesick first:

```shell
gem install homesick
```

Next, use the homesick command to clone the castle:

```shell
homesick clone caedes/dotfiles
```

With the castle cloned, link its contents into home dir:

```shell
homesick symlink dotfiles
```

## Homebrew

After installing [Homebrew](http://brew.sh/) just run in your `~` directory:

```shell
brew tap homebrew/bundle
brew bundle
```

## cURL aliases

**No more cURL please.** Use [HTTPie](https://github.com/jkbrzt/httpie)

## License

My dotfiles are released under the [MIT license](LICENSE.md).
