{ config, pkgs, ... }:

{

  imports = 
    [
      ./modules/hodules/theme.nix
      ./modules/hodules/kitty.nix
      ./modules/hodules/zshell.nix
      ./modules/hodules/mediaplayerv.nix
      ./modules/hodules/hyprland.nix
      ./modules/hodules/waybar.nix
      ./modules/hodules/firefox.nix
      ./modules/hodules/neovim.nix
      ./modules/hodules/fcitx5.nix
      ./modules/hodules/fastfetch.nix
      ./modules/hodules/wofi.nix
    ];

  home.username = "hatosu";
  home.homeDirectory = "/home/hatosu";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
  ];
  home.file = {
  };
  home.sessionVariables = {
  };
  programs.home-manager.enable = true;

}
