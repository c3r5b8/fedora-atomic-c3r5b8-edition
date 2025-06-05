#!/bin/bash

set -euo pipefail

dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf5 install -y\
	tmux sway swaybg mako wl-clipboard grim slurp alacritty git fish\
	firefox telegram dnf5-plugins

dnf5 -y copr enable lizardbyte/stable
dnf5 -y install Sunshine
dnf5 -y copr disable lizardbyte/stable

#### Example for enabling a System Unit File

systemctl enable podman.socket
