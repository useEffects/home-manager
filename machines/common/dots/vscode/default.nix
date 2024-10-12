{
  config,
  pkgs,
  lib,
  self,
  ...
}:

let 
  inputs = self.inputs;
in 

{
  programs.vscode = {
    enable = true;
    extensions = import ./extensions.nix { inherit pkgs lib inputs; };
    mutableExtensionsDir = false;
  };
  home.file = {
    "${config.xdg.configHome}/Code/User/settings.json" = {
      source = ./. + "/settings.json";
    };
  };
}
