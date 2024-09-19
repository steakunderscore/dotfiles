# Make use of the systemd unit which sets up this socket if agent's not already set
if [ -z "${SSH_AUTH_SOCK}" ]; then
  if [ -e "/run/user/$(id -u)/ssh-agent.socket" ]; then
    export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
  fi
fi

# Setup path for screen sessions to make use of ssh auth socket
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
