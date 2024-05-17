# This makes use of the systemd units
# Either use the gnome-keyring OR ssh-agent
if [ -e "/run/user/$(id -u)/keyring/ssh" ]; then
  export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh
elif [ -e "/run/user/$(id -u)/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
fi

# Setup path for screen sessions to make use of ssh auth socket
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
