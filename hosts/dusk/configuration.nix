{ stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hostpkgs.nix
    ../../modules/core
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}

