{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "awww-daemon"
      "waybar"
      "vicinae server"
    ];
  };
}
