# This makes use of the systemd unit which sets up this socket
if [ -e "/run/user/$(id -u)/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
fi
