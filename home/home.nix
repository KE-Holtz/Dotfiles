{ config, pkgs, inputs, ... }:

{
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";
  home.stateVersion = "25.05";

  imports = [ inputs.stylix.homeManagerModules.stylix hypr/default.nix code/default.nix ./shell.nix ./git.nix];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = wallpapers/minimal_squares.png;
    fonts = {
      serif = {
	package = pkgs.dejavu_fonts;
	name = "DejaVu Serif";
      };
      
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };

      emoji = {
         package = pkgs.noto-fonts-color-emoji;
         name = "Noto Color Emoji";
      };
    };
    #Disable waybar - it asks stylix for the monospace font in it's own style
    targets.waybar.enable = false;
    #Disbale vscode colors
    targets.vscode.enable = false;
    cursor = {
      package = pkgs.rose-pine-hyprcursor;
      name = "rose-pine-hyprcursor";
      size = 24;
    };
  };


  programs.obsidian.enable = true;

  programs.fastfetch.enable = true;
  home.packages = [ pkgs.cowsay ];
}
