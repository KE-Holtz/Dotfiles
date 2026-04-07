{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';

    shellAliases = {
      cat = "bat";
      ls = "eza";
      ll = "eza -la";
      la = "eza -la";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.kitty = {
    enable = true;
    settings = {
    };
  };

  programs.starship = {
    enable = true;
    settings = {
    };
  };

  home.packages = with pkgs; [
    bat
    eza
    zoxide
  ];
}
