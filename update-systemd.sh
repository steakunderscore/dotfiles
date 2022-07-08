#!/bin/sh
# Can't use freshrc to manage systemd units as systemd can't handle freshrc's
# symlinks.

mkdir -p "${HOME}/.config/systemd/user/"

cp -a "${HOME}"/.dotfiles/systemd/user/* "${HOME}"/.config/systemd/user/
