{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.git = {
    enable = true;
    extraConfig = {
      pull.rebase = false;
    };
  };
}