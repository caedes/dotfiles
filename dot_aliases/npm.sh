# npm registry switch by working directory.
# Mirrors the gitconfig includeIf pattern: when cwd is under the Kering
# project tree, point npm at the Artifactory user-config; otherwise fall
# back to ~/.npmrc (public registry).

autoload -Uz add-zsh-hook

function _npm_registry_chpwd () {
  case "$PWD/" in
    "$HOME/Documents/projects/kering/"*)
      export NPM_CONFIG_USERCONFIG="$HOME/.npmrcs/kering"
      ;;
    *)
      unset NPM_CONFIG_USERCONFIG
      ;;
  esac
}

add-zsh-hook chpwd _npm_registry_chpwd
_npm_registry_chpwd   # initialize on shell start (chpwd does not fire then)
