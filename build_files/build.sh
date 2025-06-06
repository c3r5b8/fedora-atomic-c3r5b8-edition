#!/bin/bash

set -euo pipefail

dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm\
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf5 install -y\
	tmux sway swaybg mako wl-clipboard grim slurp kitty bat git fish\
	firefox telegram dnf5-plugins greetd lxpolkit fuzzel waybar\
	power-profiles-daemon papirus-icon-theme btop fd-find\
	fzf htop ripgrep tree golang nodejs-npm thunderbird neovim\
	imv inkscape mpv blueman nmap wget android-tools\
	brightnessctl gvfs-mtp usbutils p7zip p7zip-plugins unzip zip intel-media-driver\
	intel-vpl-gpu-rt mesa-vulkan-drivers mesa-dri-drivers.i686 mesa-libGL.i686\
	mesa-vulkan-drivers.i686 steam alsa-sof-firmware

dnf5 config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf5 install -y tailscale

dnf5 -y copr enable lizardbyte/beta
dnf5 -y install Sunshine
dnf5 -y copr disable lizardbyte/beta

dnf5 -y copr enable solopasha/hyprland
dnf5 -y install hypridle hyprlock hyprpicker
dnf5 -y copr disable solopasha/hyprland

dnf5 -y copr enable lihaohong/yazi
dnf5 -y install yazi
dnf5 -y copr disable lihaohong/yazi

dnf5 -y copr enable atim/starship
dnf5 -y install starship
dnf5 -y copr disable atim/starship

systemctl enable podman.socket
systemctl enable tailscaled.service

systemctl mask systemd-remount-fs.service
