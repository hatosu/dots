{ config, pkgs, lib, inputs, ... }:

{

  imports = 
    [
      ./hardware-configuration.nix
      ./modules/codules/laptop.nix
      ./modules/codules/core.nix
      ./modules/codules/driver.nix
      ./modules/codules/font.nix
      ./modules/codules/game.nix
      ./modules/codules/hotkey.nix
      ./modules/codules/manage.nix
      ./modules/codules/package.nix
      ./modules/codules/secure.nix
      ./modules/codules/variable.nix
      ./modules/codules/virtualization.nix
      ./scripts/init.nix
      ./scripts/find.nix
      ./scripts/rebuild.nix
      ./scripts/startup.nix
      ./scripts/help.nix
      ./scripts/impermanence.nix
      inputs.home-manager.nixosModules.default
    ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "hatosu" = import ./home.nix;
    };
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration
  system.stateVersion = "24.05"; # Did you read the comment?

}
