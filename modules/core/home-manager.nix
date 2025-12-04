{ inputs, user, ... }:

{
  # home-manager nixos module
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs user; };
    users.${user} = {
      imports = (inputs.import-tree ../home);
    };
  };
}
