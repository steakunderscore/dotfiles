if [ -f "/run/user/1000/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket
fi
