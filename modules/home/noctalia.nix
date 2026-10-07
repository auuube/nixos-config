{
  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        background_opacity = 0.8;
        margin_edge = 5;
        margin_ends = 5;
        start = [ "workspaces" ];
        end = [
          "tray"
          "network"
          "bluetooth"
          "volume"
          "battery"
          "notifications"
          "control-center"
          "session"
        ];
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
            timeout = 600.0;
          };
          "lock-and-suspend" = {
            action = "lock_and_suspend";
            enabled = false;
            timeout = 900.0;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };

      location.auto_locate = true;

      widget.workspaces.style = "minimal";

      theme = {
        source = "wallpaper";
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
    };
  };
}
