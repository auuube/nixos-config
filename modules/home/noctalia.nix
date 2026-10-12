{
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";
        templates = {
          builtin_ids = [
            "gtk3"
            "gtk4"
            "ghostty"
            "hyprland"
            "starship"
          ];
          community_ids = [ "vicinae" ];
        };
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 660.0;
          };
          "lock-and-suspend" = {
            action = "lock_and_suspend";
            enabled = false;
            timeout = 900.0;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 600.0;
          };
        };
      };

      location.auto_locate = true;

      shell.panel.open_near_click_control_center = true;

      bar.default = {
        margin_ends = 0;
        radius = 0;
        background_opacity = 0.8;
        start = [
          "workspaces"
          "active_window"
        ];
        center = [ ];
        end = [
          "tray"
          "network"
          "bluetooth"
          "volume"
          "date"
          "clock"
          "control-center"
        ];
      };

      widget = {
        network.show_label = false;
        workspaces = {
          active_pill_size = 0.8;
          inactive_pill_size = 0.4;
          show_labels = false;
        };
      };
    };
  };
}
