# This makes use of the systemd units
# Either use gcr, gnome-keyring OR ssh-agent
if [ -e "$XDG_RUNTIME_DIR/gcr/ssh" ]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
elif [ -e "$XDG_RUNTIME_DIR/keyring/ssh" ]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh
elif [ -e "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
fi

# Setup path for screen sessions to make use of ssh auth socket
if [ -S "$SSH_AUTH_SOCK" ] && [ ! -h "$SSH_AUTH_SOCK" ]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
