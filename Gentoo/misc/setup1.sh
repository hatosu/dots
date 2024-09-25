#!/bin/bash

#install network packages
sudo pacman -S dhcpcd networkmanager ufw openssh wireless_tools xdg-utils iwd smartmontools wpa_supplicant net-tools

#install graphics drivers
sudo pacman -S linux-headers nvidia-dkms nvidia-utils intel-ucode egl-wayland qt5-wayland qt5ct qt6-wayland libva-nvidia-driver qt5-imageformats

#install audio related packages
sudo pacman -S pipewire pipewire-pulse wireplumber pavucontrol

#install fonts
sudo pacman -S cantarell-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-font-awesome otf-font-awesome awesome-terminal-fonts

#install desktop essentials
sudo pacman -S zsh kitty mpv feh ly wofi dunst waybar htop polkit-kde-agent brightnessctl

#install & setup window manager
sudo pacman -S hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-wlr

#software of choice
sudo pacman -S git wget wl-clipboard fuse grim slurp pacman-contrib rust unzip unrar p7zip shellcheck locate vim neovide keyd firefox fastfetch kdenlive krita freecad blender fcitx5-im fcitx5-mozc fcitx5-pinyin-zhwiki fcitx5-hangul man fzf less glances z rclone

#install & setup other package managers
yes | sudo pacman -S nix flatpak
flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
sudo usermod -a -G nix-users hatosu
sudo systemctl enable --now nix-daemon
directory="/home/hatosu/aura"
yes | sudo pacman -S cargo jdk-openjdk bat fd vi ripgrep graphviz
yes | sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/aura.git
cd aura
makepkg -s
find "$directory" -type f -name "*.pkg.tar.zst" -exec sudo pacman -U {} \;
aura check && aura conf --gen > ~/.config/aura/config.toml

#enable services
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable --now ufw.service
sudo systemctl enable keyd
sudo systemctl enable ly.service

#reboot
sudo reboot
