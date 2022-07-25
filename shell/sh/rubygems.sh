GEM_HOME="${HOME}/.gem"

if [ -d "${GEM_HOME}" ]
then
  for p in $(find "${GEM_HOME}/ruby/" -maxdepth 1 -mindepth 1 -type d | sort --reverse)
  do
    path_add "${p}/bin"
  done
fi
