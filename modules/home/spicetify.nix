{ pkgs, inputs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        beautifulLyrics
        volumePercentage
      ];
      theme = spicePkgs.themes.text;
    };
}
