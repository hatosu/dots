{ pkgs, lib, ... }: {

  #declare packages
  environment.systemPackages = with pkgs; [
    vim #must always have a text editor installed
    distrobox #package required by podman
    (pkgs.flameshot.override { enableWlrSupport = true; }) #install and apply fix to flameshot
    vesktop
    xdg-utils
    dunst
    htop
    brightnessctl
    git
    wget
    wl-clipboard
    fuse
    grim
    slurp
    unzip
    unrar
    p7zip
    shellcheck
    mlocate
    kdenlive
    krita
    freecad
    blender
    man
    less
    glances
    rclone
    zoom-us
    mpvpaper
    anki-bin
    ripdrag
    yazi
    hyprpicker
    calc
    okolors
    noti
    libreoffice-fresh
    lmms
    rarcrack
    rmlint
    tldr
    gitui
    ncdu
    hyperfine
    tokei
    watchexec
    pavucontrol
    ani-cli
    tgpt
    playerctl
    skim
    obsidian
    bottles
    lutris
    mangohud
    protonup
    minecraft
    virt-viewer
    adwaita-icon-theme
    spotify
    obs-studio
    image_optim
    imagemagick
    lshw
    wlr-randr
    swaybg
    fuzzel
    papirus-icon-theme
  ];

}
