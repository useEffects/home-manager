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
    file.".copilot/mcp-config.json".text = builtins.toJSON {
      mcpServers.whatsapp_business_tools = {
        type = "http";
        url = "https://mcp.facebook.com/whatsapp_business_tools";
        tools = [ "*" ];
      };
    };
  };

  programs.home-manager.enable = true;
}
