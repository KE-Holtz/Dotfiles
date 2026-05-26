{ config, pkgs, stylix, ... }:
{
  imports = [ ./stylix.nix ./hyprland.nix ./waybar.nix];
}

