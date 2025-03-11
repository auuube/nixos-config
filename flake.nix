{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
  let
    # configs
    system = "x86_64-linux";
    homeStateVersion = "24.11";
    user = "aube";
    hosts = [
      { hostname = "dusk"; stateVersion = "24.11"; }
    ];

    # create nixosSystem function
    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion homeStateVersion system hostname user;
      };

      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    };
  in
  {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;
  };
}
