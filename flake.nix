{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:denful/import-tree";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
      user = "aime";
      homeStateVersion = "26.05";

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

      makeSystem =
        { hostname, stateVersion }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit
              inputs
              hostname
              user
              stateVersion
              homeStateVersion
              ;
          };

          modules = [
            { hardware.facter.reportPath = ./hosts/${hostname}/facter.json; }
            (inputs.import-tree ./hosts/${hostname})
            (inputs.import-tree ./modules/core)
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.listToAttrs (
        map (host: {
          name = host.hostname;
          value = makeSystem host;
        }) hosts
      );
    };
}
