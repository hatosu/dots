{ pkgs, lib, ... }: {

  environment.shellAliases = {

    #usual aliases
    power = "shutdown -h now";
    hist = "history | grep";
    vcheat = "nvim ~/.nix/profiles/primary/resources/.vimcheatsheet";
    lcheat = "nvim ~/.nix/profiles/primary/resources/.linuxcheatsheet";
    S = "nix-shell -p";
    c = "clear && fastfetch --logo-color-1 red --logo-color-2 '90:'";
    s = "playerctl -p spotify next";
    p = "playerctl -p spotify play-pause";
    b = "playerctl -p spotify previous";

    #applications
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
