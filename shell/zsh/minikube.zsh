if [ $commands[minikube] ]; then
  source <(minikube completion $(basename $SHELL))
fi
