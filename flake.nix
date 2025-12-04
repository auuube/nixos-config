{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-flatpak.url = "github:gmodena/nix-flatpak/";

    awww.url = "git+https://codeberg.org/LGFae/awww";
    matugen.url = "github:/InioX/Matugen";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      user = "aime";
      hosts = [
        {
          hostname = "dawn";
          stateVersion = "25.05";
        }
      ];

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
              ;
          };

          modules = [
            ./hosts/${hostname}
            (inputs.import-tree ./modules/core)
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
