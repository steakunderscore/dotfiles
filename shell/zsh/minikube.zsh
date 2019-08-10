if [ $commands[minikube] ]; then
  export MINIKUBE_WANTUPDATENOTIFICATION=false
  source <(minikube completion $(basename $SHELL))
fi
