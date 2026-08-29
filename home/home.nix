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

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "hyprlock";
        }

        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  programs.hyprlock.enable = true;
  

  home.packages = [
    pkgs.ffmpeg
    pkgs.ocrmypdf
    pkgs.fd
    pkgs.cowsay
    pkgs.prismlauncher
    pkgs.gimp
    pkgs.blender
    pkgs.kdePackages.kdenlive
    pkgs.kdePackages.kdeconnect-kde
    pkgs.vlc
    pkgs.yt-dlp
    pkgs.audacity
    pkgs.yazi
    pkgs.thunar
    pkgs.btop
    pkgs.hledger
    pkgs.hledger-web
    pkgs.bitwarden-desktop
    pkgs.jetbrains.pycharm
    pkgs.networkmanagerapplet
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
