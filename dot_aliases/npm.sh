# npm registry switch by working directory.
# Mirrors the gitconfig includeIf pattern: when cwd is under the Kering
# project tree, point npm at the Artifactory user-config; otherwise fall
# back to ~/.npmrc (public registry).

autoload -Uz add-zsh-hook

function _npm_registry_chpwd () {
  case "$PWD/" in
    "$HOME/Documents/projects/kering/"*)
      # Defensive: the kering profile holds an auth token and is not in the
      # dotfiles repo. On a fresh machine it has to be created manually
      # (see AGENTS.md, "Setting up a fresh machine"). Until then, fall
      # back silently to ~/.npmrc rather than pointing npm at a missing
      # user-config (which would log ENOENT on every command).
      if [ -f "$HOME/.npmrcs/kering" ]; then
        export NPM_CONFIG_USERCONFIG="$HOME/.npmrcs/kering"
      else
        unset NPM_CONFIG_USERCONFIG
      fi
      ;;
    *)
      unset NPM_CONFIG_USERCONFIG
      ;;
  esac
}

add-zsh-hook chpwd _npm_registry_chpwd
_npm_registry_chpwd   # initialize on shell start (chpwd does not fire then)
