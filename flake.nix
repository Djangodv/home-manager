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
      cfg = {
        username = builtins.getEnv "USER";
        homeDirectory = builtins.getEnv "HOME";
        projectRoot = "${cfg.homeDirectory}/Github/home-manager";
      };

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
    in
    {
      homeConfigurations.${cfg.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          inputs.plasma-manager.homeModules.plasma-manager
          ./home.nix 
        ];
        # Optionally use extraSpecialArgs to pass through arguments to home.nix
        extraSpecialArgs = { inherit inputs; inherit cfg; };
      };
    };
}