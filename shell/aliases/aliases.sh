alias ls="ls -F"
alias ll="ls -lGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias dev="screen -RD development"
alias build="screen -RD build"
alias serve="python3 -m http.server"
alias k='kubectl'

# cat with highlight
alias cah="pygmentize -g"

# copy with a progress bar.
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

p() {
  cd "$PROJECTS/$(find "$PROJECTS" -maxdepth 5 -name .git | sed 's#/\.git$##' | sed "s#^$PROJECTS/##" | fzf)"
}

# source dotfiles
reload() {
  source $HOME/.zshrc &&
  echo "Your dot files are now \033[1;32msourced\033[0m."
}
