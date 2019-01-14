alias ls="ls -F"
alias ll="ls -lGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias dev="cd $HOME/Dev"
alias serve="python3 -m http.server"
alias task="task-git --task-git-push"

# cat with highlight
alias cah="pygmentize -g"

# highest rated results first
alias z="_z -r 2>&1"

# copy with a progress bar.
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

d() {
  if [[ -n "$1" ]]; then
    cd "+$1"
  else
    dirs -v
  fi
}

p() {
  cd "$PROJECTS/$(find "$PROJECTS" -maxdepth 5 -name .git | sed 's#/\.git$##' | sed "s#^$PROJECTS/##" | selecta)"
}

# source dotfiles
reload() {
  source $HOME/.zshrc &&
  echo "Your dot files are now \033[1;32msourced\033[0m."
}
