{ config, pkgs, ... }:
{
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    settings.user.name = "KE-Holtz";
    settings.user.email = "keholtz08@gmail.com";
  };
}
