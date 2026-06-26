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
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      homeStateVersion = "26.05";
      user = "aime";
      hosts = [
        {
          hostname = "L380";
          stateVersion = "26.05";
        }
        {
          hostname = "dawn";
          stateVersion = "26.05";
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
            { imports = (listDir ./hosts/${hostname}); }
            { imports = (listDir ./modules/core); }
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.listToAttrs (
        map (host: {
          name = host.hostname;
          value = makeSystem {
            inherit (host) hostname stateVersion;
          };
        }) hosts
      );
    };
}
