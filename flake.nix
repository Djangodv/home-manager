{
  description = "Home Manager configuration of user";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # The `follows` keyword in inputs is used for inheritance.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
    in {
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          inputs.plasma-manager.homeModules.plasma-manager
          ./home.nix 
        ];
      };
    };
}