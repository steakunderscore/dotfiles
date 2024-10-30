DEBUG=${DEBUG:=false}

if [ "$DEBUG" = true ]
then
  set -x
  zmodload zsh/zprof
else
  unset DEBUG
fi
