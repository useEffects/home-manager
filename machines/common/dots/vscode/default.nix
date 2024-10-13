{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.vscode = {
    enable = true;
    extensions = import ./extensions.nix { inherit pkgs lib; };
    mutableExtensionsDir = false;
  };
  home.file = {
    "${config.xdg.configHome}/Code/User/settings.json" = {
      source = ./. + "/settings.json";
    };
    "${config.home.homeDirectory}/.vscode/argv.json" = {
      source = ./. + "/argv.json";
    };
  };
}
