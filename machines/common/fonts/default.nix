{ config, pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
  };
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {
      fonts = [
        "CascadiaCode"
      ];
    })
    noto-fonts
  ];
  home.file = {
    "${config.xdg.configHome}/fontconfig/fonts.conf".source = ./. + "/conf.xml";
  };
}
