{ pkgs, ... }:

let
  packagesList = import ./packages.nix { pkgs = pkgs; };
in

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = packagesList;

  programs.home-manager.enable = true;
}
