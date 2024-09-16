{ pkgs, lib, ... }: {

  environment.shellAliases = {

    #standard commands
    power = "shutdown -h now";
    hist = "history | grep";
    vcheat = "nvim /etc/nixos/profiles/laptop/resources/.vimcheatsheet";
    lcheat = "nvim /etc/nixos/profiles/laptop/resources/.linuxcheatsheet";
    c = "clear";
    e = "exit";
    s = "playerctl next";
    p = "playerctl play-pause";
    b = "playerctl previous";

    #applications
    nixfind = "bash /etc/nixos/profiles/laptop/resources/nixfind.sh";
    try = "nix-shell -p";
    opt = "image_optim";
    img = "magick";
    ff = "fastfetch --logo-color-1 red --logo-color-2 '90:'";
    anime = "ani-cli -q 1080p";
    gpt = "tgpt";
    phind = "tgpt --provider phind";
    color = "okolors";
    disk = "ncdu";
    drag = "ripdrag -r";
    v = "nvim";
    y = "yazi";
    m = "mpv";

    #temp applications
    pget = "nix run nixpkgs#pirate-get -- -T -S ~/Downloads";
    torbrowser = "nix run nixpkgs#tor-browser";
    tor = "nix run nixpkgs#rqbit --";
    metaclean = "nix run nixpkgs#metadata-cleaner --";
    vidget = "nix run nixpkgs#yt-dlp --";
    spotget = "nix run nixpkgs#spotdl -- --format mp3";
    browse = "nix run nixpkgs#w3m --";
    gping = "nix run nixpkgs#gping --";

  };

}
