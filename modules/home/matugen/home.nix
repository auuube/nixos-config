{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  xdg.configFile."matugen".source = ./matugen;
}
