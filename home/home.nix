{ config, pkgs, inputs, ... }:

{
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";
  home.stateVersion = "25.05";

  imports = [ rice/default.nix ./coding.nix ./shell.nix];

  #General packages
  programs.fastfetch.enable = true;
  programs.obsidian.enable = true;
  home.packages = [
    pkgs.ffmpeg
    pkgs.cowsay
    pkgs.prismlauncher
    pkgs.gimp
    pkgs.btop
    pkgs.hyprshot
  ];

}
