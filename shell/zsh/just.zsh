if [ $commands[just] ]; then
  source <(just --completions $(basename ${SHELL}))
fi
