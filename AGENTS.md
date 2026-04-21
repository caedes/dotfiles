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

- `dot_zshrc` — Main shell config. Loads all alias files from `~/.aliases/`, configures NVM, rbenv, Java, PostgreSQL PATH entries.
- `dot_gitconfig` — Git settings with conditional includes: `~/.gitconfig-niji` for work projects, `~/.gitconfig-perso` for personal.
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
- `zsh.sh` — `update` (Brew + dotfiles), `cleanup`, `reload`

## Git conventions

Commits use **Conventional Commits** with gitmoji via `gc` (git-cz). Recent commit style: `feat: 🎸 description` or `fix: description (#PR)`.

## Development environment

Targets macOS. Key runtime dependencies managed via:

- `nvm` — Node.js
- Homebrew — system packages
- Oh-my-zsh (cobalt2 theme) — shell framework
