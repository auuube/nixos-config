{ pkgs, ... }:

{
  home.packages = with pkgs; [
    matugen
  ];
  xdg.configFile."matugen".source = ./matugen;
}
