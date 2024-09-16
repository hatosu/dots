#!/bin/bash

#download AUR packages
aura check
yes | aura -Aa zoom mpvpaper vesktop-bin flameshot-git anki-bin minecraft-launcher blobdrop-git ani-cli-git 

#download nix packages
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update unstable
NIXPKGS_ALLOW_UNFREE=1 nix-env --install yazi spotify hyprpicker nap calc okolors noti libreoffice lmms rarcrack rmlint tldr porsmo gitui ncdu hyperfine tokei watchexec

#download flatpak packages
flatpak install flathub com.github.tchx84.Flatseal com.obsproject.Studio com.usebottles.bottles com.brave.Browser io.gitlab.adhami3310.Converter io.github.nokse22.Exhibit io.github.seadve.Kooha io.gitlab.theevilskeleton.Upscaler com.rafaelmardojai.Blanket net.lutris.Lutris org.gnome.Characters io.github.nokse22.asciidraw

#install vundle for neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
