{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    matugen.url = "github:/InioX/Matugen";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      user = "aime";
      hosts = [
        {
          hostname = "dawn";
          stateVersion = "25.05";
        }
      ];

      # haumea
      listDir =
        path:
        let
          tree = inputs.haumea.lib.load {
            src = path;
            loader = inputs.haumea.lib.loaders.path;
          };
          flatten =
            attrs:
            builtins.concatMap (v: if builtins.isAttrs v then flatten v else [ v ]) (builtins.attrValues attrs);
        in
        flatten tree;

      makeSystem =
        { hostname, stateVersion }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit
              inputs
              hostname
              user
              stateVersion
              homeStateVersion
              listDir
              ;
          };

          modules = [
            { imports = (listDir ./modules/nixos/hosts/${hostname}); }
            { imports = (listDir ./modules/nixos/core); }
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname stateVersion;
          };
        }
      ) { } hosts;
    };
}
