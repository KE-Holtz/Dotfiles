{ config, pkgs, inputs, ... }:

{
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    LEDGER_FILE = "$HOME/Documents/Finance/journal.hledger";
  };

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
    pkgs.blender
    pkgs.kdePackages.kdenlive
    pkgs.kdePackages.kdeconnect-kde
    pkgs.vlc
    pkgs.audacity
    pkgs.yazi
    pkgs.thunar
    pkgs.btop
    pkgs.hledger
    pkgs.hledger-web
  ];

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };
}
