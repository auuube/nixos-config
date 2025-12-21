{
  pkgs,
  hostname,
  options,
  ...
}:

{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };

  # environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
