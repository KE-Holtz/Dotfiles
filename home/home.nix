{ config, pkgs, inputs, ... }:

{
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";
  home.stateVersion = "25.05";

  imports = [ rice/default.nix ./coding.nix ./shell.nix inputs.zen-browser.homeModules.twilight];

  #General packages
  programs.fastfetch.enable = true;
  programs.zen-browser.enable = true;
  programs.obsidian.enable = true;

  programs.hyprshot = {
    enable = true;
    saveLocation = "/home/kyle/Documents/Screenshots";
  };
  home.packages = [
    pkgs.ffmpeg
    pkgs.fd
    pkgs.cowsay
    pkgs.prismlauncher
    pkgs.gimp
    # pkgs.kdePackages.kdenlive
    # pkgs.kdePackages.kdeconnect-kde
    pkgs.vlc
    pkgs.yazi
    pkgs.thunar
    pkgs.btop
  ];

}
