# AGENTS.md

This file provides guidance to AI coding assistants (Claude Code, Gemini, Cursor, etc.) when working with code in this repository.

## What this repo is

A personal chezmoi-managed dotfiles repository for macOS. Files prefixed with `dot_` map to dotfiles in `$HOME` (e.g., `dot_zshrc` → `~/.zshrc`).

## Dotfiles management

```bash
chezmoi apply          # Apply changes to home directory
chezmoi update         # Pull from git and apply
chezmoi diff           # Preview pending changes
chezmoi cd             # cd into this source directory
```

The `dot_dotfiles_update` script is sourced by `.zshrc` and auto-runs `chezmoi update` every 7 days.

## Structure

- `dot_zshrc` — Main shell config. Sources a curated list of alias files from `~/.aliases/` (explicit `. ~/.aliases/<name>.sh` lines — not a glob), configures NVM, rbenv, Java, PostgreSQL PATH entries, plus bun integration.
- `dot_gitconfig` — Git settings with `includeIf gitdir:` rules pointing at per-context configs in `~/Documents/projects/<group>/.gitconfig` (currently `niji/`, `personal/`, `kering/`). Each per-context file sets identity, signing key, and (for Kering) the GitHub URL rewrite to use the `github-kering` SSH host alias.
- `dot_aliases/` — Modular alias/function files loaded in alphabetical order. `colors.sh` and `text.sh` must load before others (they define helpers used downstream).
- `dot_vimrc` — Minimal vim config (syntax, 2-space indent, no backups).
- `dot_gitignore_global` — Global git ignores.

## Alias module system

Each file in `dot_aliases/` is a standalone shell script sourced by `.zshrc`. Key modules:

- `git.sh` — `gc` (commitizen), `gsync` (rebase from origin/master), `gbclean`, branch creation helpers
- `worktrunk.sh` — `wtc <type> <name>` creates a Worktrunk branch (feature/hotfix)
- `rails.sh` — Foreman shortcuts (`fs`, `fsd`), Rails console/grep
- `pg.sh` — PostgreSQL helpers: `resetdb`, `restoredb <file>`, `dumpdb`, `hedumpdb <app>` (Heroku)
- `editor.sh` — `c` for Cursor IDE, `cc` for Claude Code, `note` for meeting notes
- `npm.sh` — registers a `chpwd` hook that switches `NPM_CONFIG_USERCONFIG` to `~/.npmrcs/kering` when the working directory is under `~/Documents/projects/kering/`, and unsets it elsewhere
- `zsh.sh` — `update` (Brew + dotfiles), `cleanup`, `reload`

## npm registry per directory

The default `~/.npmrc` points at the public npm registry (`registry.npmjs.org`). For Kering work, an alternative user-config lives at `~/.npmrcs/kering` and holds the Artifactory registry plus auth token (perms `600`, never committed).

The `npm.sh` alias module exports `NPM_CONFIG_USERCONFIG=~/.npmrcs/kering` whenever the working directory is under `~/Documents/projects/kering/`, and unsets it elsewhere. The switch happens at every `cd` and at shell startup.

Limitations: this only covers interactive zsh. A non-shell launch (IDE, CI) that does not inherit the env var will fall back to the public registry. For projects that need to enforce the Kering registry regardless of launch context, drop a per-repo `.npmrc` at the project root — it has higher precedence than the user-config.

## Git conventions

Commits use **Conventional Commits** with gitmoji via `gc` (git-cz). Recent commit style: `feat: 🎸 description` or `fix: description (#PR)`.

## Development environment

Targets macOS. Key runtime dependencies managed via:

- `nvm` — Node.js
- Homebrew — system packages
- Oh-my-zsh (cobalt2 theme) — shell framework
