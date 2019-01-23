if [ $commands[helm] ]; then
  source <(helm completion $(basename ${SHELL}))
fi
