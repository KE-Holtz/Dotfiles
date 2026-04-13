# FRC.nix — NixOS module for FRC Java robot development
#
# Assumes frc-nix overlay is already applied in your flake.nix:
#   nixpkgs.overlays = [ frc-nix.overlays.default ];
#
# Import this module in your nixosConfigurations, e.g.:
#   modules = [ ./modules/FRC.nix ];

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── FRC Tooling (from frc-nix overlay) ────────────────────────────────
    advantagescope       # log visualization & replay
    pathplanner          # autonomous path planning GUI
    elastic-dashboard    # driver station dashboard
    wpilib-java          # WPILib SDK + Java toolchain (JDK 17 bundled)
    gradle               # build tool used by WPILib Java projects
    # ── Editor ────────────────────────────────────────────────────────────
    vscode-frc           # VS Code with the WPILib extension pre-configured
  ];
}
