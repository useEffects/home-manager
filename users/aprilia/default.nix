{ pkgs, ... }:

{
  home.username = "aprilia";
  home.homeDirectory = "/home/aprilia";

  programs.git = {
    enable = true;
    userEmail = "joel.sr1024@gmail.com";
    userName = "useEffects";
  };
}
