{
  config,
  pkgs,
  lib,
  ...
}:

let
  themeDir = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}";
in

{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "pink" ];
        size = "standard";
        tweaks = [
          "rimless"
          "normal"
        ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "pink";
      };
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "quick-settings-tweaks@qwreey"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "catppuccin-mocha-pink-standard+rimless,normal";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = lib.mkForce "catppuccin-mocha-pink-standard+rimless,normal";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };
  xdg = lib.mkIf config.gtk.enable {
    configFile."gtk-4.0/assets" = {
      source = "${themeDir}/gtk-4.0/assets";
      recursive = true;
    };
    configFile."gtk-4.0/gtk.css".source = "${themeDir}/gtk-4.0/gtk.css";
    configFile."gtk-4.0/gtk-dark.css".source = "${themeDir}/gtk-4.0/gtk-dark.css";
  };
}
