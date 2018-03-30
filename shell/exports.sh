export DOTFILES=~/.dotfiles                     # here
export ARCHFLAGS='-arch x86_64'                 # archflags
export GH_LOGIN="$(git config github.username)" # used by git-go
export GITHUB_URL="$(git config github.url)"    # used by gist

path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add "$HOME/bin"
path_add "/usr/local/bin"
path_add "/usr/local/sbin"
path_add "/usr/local/share/npm/bin"

if type go >/dev/null 2>&1; then
  export GOPATH=$HOME/go
  path_add "$GOPATH/bin"
fi

export PROJECTS=~/Dev
