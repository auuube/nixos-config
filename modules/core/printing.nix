{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        canon-capt
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    ipp-usb.enable = true;
  };
}
