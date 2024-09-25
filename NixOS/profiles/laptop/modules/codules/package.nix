{ pkgs, lib, ... }: {

  environment = {
    systemPackages = with pkgs; [

      #core
      vim
      xdg-utils
      wl-clipboard
      dunst
      fuzzel
      adwaita-icon-theme
      papirus-icon-theme
  
      #cli tools
      tmux
      htop
      todo-txt-cli
      brightnessctl
      git
      bat
      ponymix
      navi
      tgpt
      tokei
      gitui
      rarcrack
      rmlint
      tldr
      ncdu
      hyperfine
      watchexec
      wget
      unzip
      unrar
      p7zip
      shellcheck
      mlocate
      man
      less
      glances
      rclone
      ripdrag
      yazi
      calc
      okolors
      noti
      image_optim
      imagemagick
      lshw
      wlr-randr
      ani-cli
      playerctl
      skim
      mangohud
      protonup
      swaybg
      hyprpicker
      vlc
      davfs2
  
      #programs
      zed-editor
      vesktop
      kdenlive
      krita
      blender
      zoom-us
      anki-bin
      libreoffice-fresh
      lmms
      obsidian
      bottles
      lutris
      minecraft
      virt-viewer
      spotify
      obs-studio
      freecad
  
      #podman packages
      distrobox
  
      #screenshot software
      (pkgs.flameshot.override { enableWlrSupport = true; })
      grim
      slurp

      ];

    shellAliases = {

      #temporary packages
      pget = "nix run nixpkgs#pirate-get -- -T -S ~/Downloads";
      torbrowser = "nix run nixpkgs#tor-browser";
      tor = "nix run nixpkgs#rqbit --";
      metaclean = "nix run nixpkgs#metadata-cleaner --";
      vidget = "nix run nixpkgs#yt-dlp --";
      spotget = "nix run nixpkgs#spotdl -- --format mp3";
      browse = "nix run nixpkgs#w3m --";
      gping = "nix run nixpkgs#gping --";

    };

  };

}
