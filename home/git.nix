{ config, pkgs, ... }:
{
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userName = "KE-Holtz";
    userEmail = "keholtz08@gmail.com";
  };
}
