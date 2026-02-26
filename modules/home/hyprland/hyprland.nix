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
      ################
      ### MONITORS ###
      ################

      monitor = ",1920x1080@180hz,auto,1";

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

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      #####################
      ### LOOK AND FEEL ###
      #####################

      general = {
        layout = "dwindle";
        gaps_in = 4;
        gaps_out = 5;
        border_size = 2;
        resize_on_border = false;

        "col.active_border" = "$primary $secondary 45deg";
        "col.inactive_border" = "rgba(4d5d69aa)";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 14;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(ee1a1a1a)";
        };
      };

      master = {
        new_status = "master";
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true; # Variable Frame Rate
        vrr = 2; # Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0

        #  Application not responding (ANR) settings
        enable_anr_dialog = true;
        anr_missed_pings = 15;
      };

      # unscale XWayland
      xwayland = {
        force_zero_scaling = true;
      };

      "source" = "colors.conf"; # source matugen colors
    };
  };
}
