{ inputs, system, homeStateVersion, user, ... }:

{
  # home-manager nixos module
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs user system; };
    users.${user} = {
      imports = [ ../home ];
      home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
        stateVersion = homeStateVersion;
      };

      programs.home-manager.enable = true;
    };
  };
}
