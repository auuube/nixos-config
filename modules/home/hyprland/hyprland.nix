{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    hyprpolkitagent
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null; # use package from the nixos module
    portalPackage = null;
    systemd.enable = false; # use uwsm

    settings = {

      "source" = "colors.conf"; # source matugen colors

      ################
      ### MONITORS ###
      ################

      monitor = ",1366x768@60hz,auto,1";

      #####################
      ### LOOK AND FEEL ###
      #####################

      general = {
        gaps_in = 4;
        gaps_out = 5;

        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "$primary $secondary 45deg";
        "col.inactive_border" = "rgba(4d5d69aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {

        rounding = 14;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 0.9;

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          vibrancy = 0.8;
          contrast = 0.6;
          size = 8;
          passes = 2;
          ignore_opacity = true;
        };
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling.
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true;
      };

      #############
      ### INPUT ###
      #############

      input = {
        kb_layout = "us";
        # kb_variant = colemak;
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0; # 0 means no modification.
        accel_profile = "flat";
      };
    };
  };
}
