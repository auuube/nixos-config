{
  inputs,
  user,
  homeStateVersion,
  ...
}:

{
  # home-manager nixos module
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users.${user} = {
      imports = [ (inputs.import-tree (inputs.self + "/modules/home")) ];
      home = {
        username = user;
        homeDirectory = "/home/${user}";
        stateVersion = homeStateVersion;
      };
    };
  };
}
