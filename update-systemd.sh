#!/bin/sh
# Can't use freshrc to manage systemd units as systemd can't handle freshrc's
# symlinks.

cp -a systemd/user/* "${HOME}"/.config/systemd/user/
