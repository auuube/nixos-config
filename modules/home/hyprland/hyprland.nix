{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpolkitagent
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null; # use package from the nixos module
    portalPackage = null;
    systemd.enable = false; # use uwsm

    extraLuaFiles = {
      animations = ./lua/animations.lua;
      binds = ./lua/binds.lua;
      env = ./lua/env.lua;
      options = ./lua/options.lua;
      rules = ./lua/rules.lua;
      startup = ./lua/startup.lua;
    };
  };
}
