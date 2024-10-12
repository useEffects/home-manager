{ lib, ... }:

let
  flakeRoot = ./. + "../../..";
in

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      "picture-uri" = "${flakeRoot}/wallpapers/catppuccin-wavy.jpg";
      "picture-uri-dark" = "${flakeRoot}/wallpapers/catppuccin-wavy.jpg";
    };
  };
}
