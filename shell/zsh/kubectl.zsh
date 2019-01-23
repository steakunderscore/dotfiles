if [ $commands[kubectl] ]; then
  source <(kubectl completion $(basename ${SHELL}))
fi

export KUBECONFIG=${HOME}/.kube/config
for file in ${HOME}/.kube/configs/*.yaml; do
  export KUBECONFIG=$KUBECONFIG:$file
done
