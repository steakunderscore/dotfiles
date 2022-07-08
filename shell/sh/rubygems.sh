for p in $(find $HOME/.gem/ruby/ -maxdepth 1 -mindepth 1 -type d | sort --reverse)
do
  path_add "${p}/bin"
done
