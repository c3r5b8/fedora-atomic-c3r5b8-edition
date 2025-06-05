#!/bin/bash

set -euo pipefail

dnf5 install -y\
	tmux sway swaybg mako wl-clipboard grim slurp alacritty git fish

dnf5 -y copr enable lizardbyte/stable
dnf5 -y install Sunshine
dnf5 -y copr disable lizardbyte/stable

#### Example for enabling a System Unit File

systemctl enable podman.socket
