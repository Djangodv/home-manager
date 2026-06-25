{ config, lib, pkgs, cfg, ... }:
{

  imports = [

    ./programs
    ./pkgs.nix

  ];

  home = {

    # This needs to actually be set to your username
    username = cfg.username;
    homeDirectory = cfg.homeDirectory;

    # NOTE: Using the actual path isn't the greatest solution (maybe copy from /nix/store instead?)
    # activation.symlinks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   ln -sf ~/Github/nixos/theme/wallpapers/ ~/.local/share/
    #   ln -sf ~/Github/nixos/bookmarks/places.sqlite ~/.mozilla/firefox/default/places.sqlite
    # '';

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.11";
  };

  # xdg.configFile."mimeapps.list".force = true;

  # Fix: "bash: home-manager: command not found"
  # Source: https://nix-community.github.io/home-manager/usage/configuration.html#configuration-example
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
