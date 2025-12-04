{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null; # use package from the nixos module
    portalPackage = null;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };

    settings = {

      "source" = "colors.conf"; # source matugen colors

      ################
      ### MONITORS ###
      ################

      monitor = ",1920x1080@180hz,auto,1";

      #################
      ### AUTOSTART ###
      #################

      exec-once = [
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "awww-daemon"
        "waybar"
        "vicinae server"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = [
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "GDK_SCALE,1"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "QT_SCALE_FACTOR,1"
        "USE_LAYER_SHELL,0"
      ];

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

      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 0.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slidefade 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
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

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
