{ pkgs, lib, inputs, ... }: {

  #enable licensed software, experimental features, and broken packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowBroken = true;

  #automatically clear temp nix files older than 7 days
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

}
