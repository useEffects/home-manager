{
  config,
  pkgs,
  lib,
  ...
}:

let
  cwd = ./.;
in

{
  programs.kitty = {
    enable = true;
  };
  home.file = {
    "${config.xdg.configHome}/kitty/kitty.conf".source = lib.mkDefault "${cwd}/kitty.conf";
  };
}
