if [ $commands[golangci-lint] ]; then
  source <(golangci-lint completion $(basename $SHELL))
  compdef _golangci-lint golangci-lint
fi

