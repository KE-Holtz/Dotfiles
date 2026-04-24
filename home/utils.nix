{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.ffmpeg
  ];
}

