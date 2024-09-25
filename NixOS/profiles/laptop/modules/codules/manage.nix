{ pkgs, lib, inputs, ... }: {

  #enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #enable proprietary & broken packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  #automatically clear nix garbage older than a week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

}
