{ config, pkgs, ... }:

{

  imports = 
    [
      ./modules/hodules/theming.nix
      ./modules/hodules/river.nix
      ./modules/hodules/kitty.nix
      ./modules/hodules/zshell.nix
      ./modules/hodules/mediaplayerv.nix
      ./modules/hodules/homelinks.nix
      ./modules/hodules/waybar.nix
      ./modules/hodules/firefox.nix
      ./modules/hodules/neovim.nix
      ./modules/hodules/fastfetch.nix
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
