{
  description = "NixOS flake";

  inputs = {

    #input for nixos unstable packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #input for home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./profiles/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            inputs.disko.nixosModules.default
            (import ./profiles/desktop/disko.nix { device = "/dev/nvme0n1"; })
            inputs.impermanence.nixosModules.impermanence
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./profiles/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            inputs.disko.nixosModules.default
            (import ./profiles/laptop/disko.nix { device = "/dev/nvme0n1"; })
            inputs.impermanence.nixosModules.impermanence
          ];
        };
      };

    };
}
