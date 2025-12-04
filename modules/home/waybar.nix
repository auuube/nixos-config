{
  programs.waybar = {
    enable = true;
    style = ''
      @import "colors.css";
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono NFM";
        padding: 0;
        margin: 0;
        min-width: 10px;
        background: transparent;
      }
      window.#waybar {
        min-width: 40px;
      }
      tooltip,
      #tray menu {
        background: alpha(@surface, 0.999);
        border-radius: 8px;
        padding: 1px 2px;
      }
      #custom-separator {
        margin: -10px 0;
        font-size: 28px;
      }
      #top,
      #workspaces,
      #bottom {
        background: @surface_container;
        padding: 8px 0;
        border-radius: 0 16px 16px 0;
      }
      box.empty {
        font-size: 0;
        margin: 0;
        padding: 0;
      }
      #workspaces {
        min-width: 0;
        padding: 8px 14px;
        margin: 20px 0;
      }
      #workspaces button {
        font-size: 7px;
        color: transparent;
        background: @on_surface;
        transition: all 0.2s ease-in-out;
        min-width: 0;
        min-height: 0;
        border-radius: 9999px;
        margin: 3px 0;
      }
      #workspaces button.active {
        background: @primary;
        min-height: 40px;
      }
      #bottom,
      #top {
        color: @on_surface;
        padding-right: 5px;
        padding-left: 5px;
      }
      #network {
        margin-bottom: 8px;
      }
      #bluetooth,
      #network {
        font-size: 18px;
      }
      #bluetooth.battery,
      #bluetooth,
      #network {
        font-family: "Material Symbols Rounded";
      }
      #bluetooth.battery.on {
        font-size: 0;
        margin: 0;
        padding: 0;
      }
      #tray,
      #network {
        margin-top: 8px;
      }
    '';
    settings = [
      {
        layer = "top";
        position = "left";
        orientation = "vertical";
        reload_style_on_change = true;
        modules-center = [
          "hyprland/workspaces"
          "group/bottom"
        ];
        "group/bottom" = {
          orientation = "inherit";
          modules = [
            "tray"
            "network"
            "bluetooth"
            "bluetooth#battery"
            "custom/separator"
            "clock"
          ];
        };
        "hyprland/workspaces" = {
          format = "{id}";
          all-outputs = true;
        };
        tray = {
          icon-size = 21;
          spacing = 10;
        };
        network = {
          format-wifi = "wifi";
          format-disconnected = "wifi_off";
          format-ethernet = "lan";
          tooltip = false;
        };
        bluetooth = {
          format-connected = "bluetooth";
          format = "bluetooth";
          format-off = "bluetooth_disabled";
          tooltip = false;
        };
        "bluetooth#battery" = {
          format = "";
          format-connected-battery = "{device_battery_percentage}";
        };
        "custom/separator" = {
          format = " ";
          tooltip = false;
        };
        clock = {
          format = "{:%H\n%M}";
          tooltip-format = "{:%a %b %d, %Y}";
        };
      }
    ];
  };
}
