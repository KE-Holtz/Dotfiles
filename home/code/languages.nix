{ config, pkgs, ... }:

{
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

    # --- JavaScript / TypeScript ---
    nodejs
    nodePackages.npm
    nodePackages.typescript
    nodePackages.yarn

    # --- Go ---
    go

    # --- Nix ---
    nixd          # nix language server
    alejandra     # nix formatter
  ];
}
