if [ $commands[aws_zsh_completer.sh] ]; then
  autoload -Uz compinit
  compinit
  source $(echo $commands[aws_zsh_completer.sh])
fi
