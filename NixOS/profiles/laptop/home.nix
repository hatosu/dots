{ config, pkgs, ... }:

{

  imports = 
    [
      ./modules/hodules/fastfetch.nix
      ./modules/hodules/homelinks.nix
      ./modules/hodules/waybar.nix
      ./modules/hodules/neovim.nix
      ./modules/hodules/terminal.nix
      ./modules/hodules/firefox.nix
      ./modules/hodules/mediaplayerv.nix
      ./modules/hodules/other.nix
      ./modules/hodules/theming.nix
    ];

  home.username = "hatosu";
  home.homeDirectory = "/home/hatosu";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
  ];
  home.sessionVariables = {
  };
  programs.home-manager.enable = true;

}
