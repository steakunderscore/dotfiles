path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add "$HOME/bin"
path_add "/usr/local/bin"
path_add "/usr/local/sbin"
