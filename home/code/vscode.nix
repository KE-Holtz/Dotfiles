{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    #Set the color theme, stylix ignores vscode
    userSettings = {
      # Theme
      "workbench.colorTheme" = "Solarized Dark";

      # Formatters / defaults
      "editor.formatOnSave" = true;

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";

      # Python
      "python.defaultInterpreterPath" = "python3";

      # Rust
      "rust-analyzer.checkOnSave.command" = "clippy";
    };
  };
}
