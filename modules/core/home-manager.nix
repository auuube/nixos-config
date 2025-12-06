{
  inputs,
  user,
  homeStateVersion,
  listDir,
  ...
}:

{
  # home-manager nixos module
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs user; };
    users.${user} = {
      imports = (listDir ../home);
      home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
        stateVersion = homeStateVersion;
      };
    };
  };
}
