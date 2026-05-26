{ config, pkgs, ... }:

{
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    settings.user.name = "KE-Holtz";
    settings.user.email = "keholtz08@gmail.com";
  };

  programs.vscode = {
      enable = true;
      userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk21}/lib/openjdk";
      "vim.useCtrlKeys" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay"= 250;
    };
  };

  home.packages = with pkgs; [
    # --- Java ---
    openjdk21

    # --- Rust ---
    rustc
    cargo
    cargo-generate
    rustfmt
    clippy
    bacon

    # --- Python ---
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # --- C / C++ ---
    gcc
    gnumake
    cmake

    # --- Go ---
    go

    # --- Nix ---
    nixd          # nix language server
    alejandra     # nix formatter
  ];
}
