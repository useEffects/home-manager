{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      homeConfigurations."desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs lib;
        modules = [ ./machines/common ./machines/desktop ./users/aprilia ];
      };
      homeConfigurations."acer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs lib;
        modules = [ ./machines/common ./machines/acer ./users/aprilia ];
      };
    };
}
