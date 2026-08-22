{
  services = {
    libinput.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      extraConfig.pipewire = {
        "10-defaults" = {
          "context.properties" = {
            "default.clock.allowed-rates" = [ 44100 48000 96000 ];
          };
          "resample.properties" = {
            "resample.quality" = 14;
          };
        };
      };

      extraConfig.client = {
        "10-resample" = {
          "resample.properties" = {
            "resample.quality" = 14;
          };
        };
      };

      extraConfig.pipewire-pulse = {
        "10-defaults" = {
          "pulse.properties" = {
            "pulse.min.req" = "1024/48000";
            "pulse.default.req" = "1024/48000";
            "pulse.max.req" = "2048/48000";
            "pulse.min.quantum" = "32/48000";
            "pulse.max.quantum" = "2048/48000";
          };
          "stream.properties" = {
            "resample.quality" = 14;
          };
        };
      };
    };
  };
}
