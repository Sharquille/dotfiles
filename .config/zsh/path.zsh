# Keep dotfile-managed commands available in every shell.
_config_bin="${XDG_CONFIG_HOME:-$HOME/.config}/bin"

if [[ ":$PATH:" != *":${_config_bin}:"* ]]; then
  export PATH="${_config_bin}:$PATH"
fi

unset _config_bin
