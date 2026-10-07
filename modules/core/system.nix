{ stateVersion, ... }:

{
  nix = {
    settings = {
      download-buffer-size = 200000000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  system.stateVersion = stateVersion;
}
