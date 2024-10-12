{ pkgs, ... }:

{
  home.username = "aprilia";
  home.homeDirectory = "/home/aprilia";

  programs.git = {
    userEmail = "joel.sr1024@gmail.com";
    userName = "useEffects";
    extraConfig = {
      credential = {
        helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        credentialStore = "cache";
      };
    };
  };
}
