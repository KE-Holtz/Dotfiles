{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      # --- Nix ---
      jnoortheen.nix-ide

      # --- Rust ---
      rust-lang.rust-analyzer

      # --- Python ---
      ms-python.python
      ms-python.vscode-pylance

      # --- Java ---
      vscjava.vscode-java-pack

      # --- C / C++ ---
      ms-vscode.cpptools

      # --- JavaScript / TypeScript ---
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode

      # --- General / Git ---
      eamodio.gitlens

      # --- Misc useful ---
      usernamehw.errorlens
    ];

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
