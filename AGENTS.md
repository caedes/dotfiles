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

- `dot_zshrc` — Main shell config. Sources a curated list of alias files from `~/.aliases/` (explicit `. ~/.aliases/<name>.sh` lines — not a glob), configures NVM, rbenv, Java, PostgreSQL PATH entries, plus bun integration. Shell integrations for `wt` (Worktrunk) and `zoxide` are appended at the end, each guarded by `command -v` so a fresh machine without the binary starts cleanly.
- `dot_gitconfig` — Git settings with `includeIf gitdir:` rules pointing at per-context configs in `~/Documents/projects/<group>/.gitconfig` (currently `niji/`, `personal/`, `kering/`). Each per-context file sets identity, signing key, and (for Kering) the GitHub URL rewrite to use the `github-kering` SSH host alias.
- `dot_aliases/` — Modular alias/function files loaded in alphabetical order. `colors.sh` and `text.sh` must load before others (they define helpers used downstream).
- `dot_npmrcs/` — Example npm user-configs that the `npm.sh` hook can switch to. Only `*.example` files are tracked (real configs hold auth tokens and live un-tracked next to them, see "npm registry per directory").
- `dot_vimrc` — Minimal vim config (syntax, 2-space indent, no backups).
- `dot_gitignore_global` — Global git ignores.
- `dot_claude/themes/cobalt2.json` — Claude Code custom theme (Cobalt2), see "Cobalt2 theme".
- `dot_config/ghostty/` — Ghostty config + Cobalt2 theme. Also the import source for Orca's terminal colors, see "Cobalt2 theme".

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

### Setting up a fresh machine

`~/.npmrcs/kering` contains an Artifactory auth token and is **never** committed to this repo. On a clean machine, after `chezmoi apply`:

1. The hook is installed and active, but defensive: if `~/.npmrcs/kering` is missing it silently falls back to `~/.npmrc` (public). No ENOENT spam.
2. To enable the Kering registry, materialize the example and paste the real token:

   ```bash
   cp ~/.npmrcs/kering.example ~/.npmrcs/kering
   $EDITOR ~/.npmrcs/kering        # replace PASTE_YOUR_ARTIFACTORY_TOKEN_HERE
   chmod 600 ~/.npmrcs/kering
   ```

3. Open a new shell (or `source ~/.zshrc`); `cd` into a `~/Documents/projects/kering/` repo and confirm with `npm config get registry` that you see the Artifactory URL.

The token can be pulled from your password manager or another machine via a secure channel — do not commit it.

## Cobalt2 theme (Claude Code + Orca)

One palette, Wes Bos's [Cobalt2 for VS Code](https://github.com/wesbos/cobalt2-vscode), shared by the Orca terminal and Claude Code. Background is the editor blue `#193549` (not the VS Code terminal panel `#122738`).

- **Orca terminal** — `~/.config/ghostty/config` sets `theme = cobalt2`, resolved from `~/.config/ghostty/themes/cobalt2`. Orca reads exactly these paths when importing (checked in Orca 1.4.232). The import copies the colors into Orca's settings, which live in a SQLite profile DB (`~/Library/Application Support/orca/`), so it is a one-off manual step, not something chezmoi keeps in sync. Re-import after changing the palette.
- **Claude Code** — `~/.claude/themes/cobalt2.json`, base `dark-ansi`: it inherits the 16 ANSI colors from the Orca terminal, then overrides the accent, dimmed text, diffs and borders. Dimmed text is overridden on purpose: Cobalt2's brightBlack `#0050a4` is unreadable on `#193549` (contrast 1.6:1). Diff tokens are backgrounds, hence the darker greens/reds.
- **Orca UI** (sidebars, tabs, buttons) — not themable beyond dark/light and a sidebar tint.

### Setting up a fresh machine

1. `chezmoi apply`.
2. Orca → Settings → Terminal → **Import from Ghostty**, review the diff, apply.
3. Orca → Settings → Appearance, sidebar tint (manual, stored in the Orca DB):
   - appearance mode: **tinted** (`leftSidebarAppearanceMode`)
   - tint color: `#0088ff` (`leftSidebarTintColor`)
   - tint opacity: `0.15` (`leftSidebarTintOpacity`, max `0.35`)
4. Claude Code: run `/theme` and pick **Cobalt2** (stored as `custom:cobalt2`). If `~/.claude/themes/` did not exist when Claude Code started, restart it once first.

## Git conventions

Commits use **Conventional Commits** with gitmoji via `gc` (git-cz). Recent commit style: `feat: 🎸 description` or `fix: description (#PR)`.

## Development environment

Targets macOS. Key runtime dependencies managed via:

- `nvm` — Node.js
- Homebrew — system packages
- Oh-my-zsh (cobalt2 theme) — shell framework
