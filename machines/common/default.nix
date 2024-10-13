{ pkgs, ... }:

let
  packagesList = import ./packages.nix { pkgs = pkgs; };
in

{

  imports = [
    ./dots
    ./fonts
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    stateVersion = "24.05"; # Please read the comment before changing.
    packages = packagesList;
  };

  programs.home-manager.enable = true;
}
