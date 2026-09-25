{
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [ inputs.disko.nixosModules.disko ];

  options.disko.rootDevice = lib.mkOption {
    type = lib.types.str;
    description = "by-id path of the disk to partition as this host's root disk.";
  };

  config.disko.devices.disk.main = {
    device = config.disko.rootDevice;
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          type = "EF00";
          size = "500M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
