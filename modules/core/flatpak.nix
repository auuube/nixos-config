{ inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services = {
    flatpak = {
      enable = true;
      update.onActivation = true;
      packages = [
        "com.github.tchx84.Flatseal" # Manage flatpak permissions
        "io.github.flattool.Warehouse" # Manage flatpaks, clean data, remove flatpaks and deps
      ];
    };
  };
}
