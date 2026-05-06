{ config, pkgs, ... }:

{
  programs.vscode = {
      enable = true;
      userSettings = {
      "java.jdt.ls.java.home" = "${pkgs.jdk21}/lib/openjdk";
      "vim.useCtrlKeys" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay"= 250;
    };
  };
}
