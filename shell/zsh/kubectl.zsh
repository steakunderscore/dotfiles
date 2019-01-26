if [ $commands[kubectl] ]; then
  source <(kubectl completion $(basename ${SHELL}))
fi

# If initial kube config exists
if [ -f ${HOME}/.kube/config ]; then
  export KUBECONFIG=${HOME}/.kube/config
  # Check for more configs
  if [ -d ${HOME}/.kube/configs/ ]; then
    for file in ${HOME}/.kube/configs/*.yaml; do
      export KUBECONFIG=$KUBECONFIG:$file
    done
  fi
fi
