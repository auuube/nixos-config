{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 8;
        margin-left = 12;
        margin-right = 12;
        spacing = 8;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "network"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          format = "{title}";
          separate-outputs = true;
          rewrite = {
            "" = "Desktop";
          };
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "pulseaudio" = {
          format = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>{icon}</span> {volume}%";
          format-muted = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>volume_off</span> Muted";
          format-icons = {
            default = [
              "volume_mute"
              "volume_down"
              "volume_up"
            ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>{icon}</span> {capacity}%";
          format-charging = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>battery_charging_full</span> {capacity}%";
          format-icons = [
            "battery_0_bar"
            "battery_3_bar"
            "battery_5_bar"
            "battery_full"
          ];
        };

        "network" = {
          format-wifi = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>wifi</span> {essid}";
          format-ethernet = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>settings_ethernet</span> {ifname}";
          format-disconnected = "<span font_family='Material Symbols Outlined' size='13.5pt' rise='-3000'>signal_wifi_off</span> Offline";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };

    style = ''
      @import "colors.css";

      * {
        font-family: "Inter";
        font-size: 14px;
        font-weight: 500;
        border: none;
        box-shadow: none;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #tray {
        background-color: @surface_container_low;
        color: @on_surface;
        padding: 0 14px;
        border-radius: 24px;
        min-height: 38px;
      }

      #workspaces {
        padding: 0 4px;
      }

      #workspaces button {
        color: @on_surface_variant;
        padding: 0 5px;
      }

      #workspaces button.active {
        color: @primary;
        background-color: @primary_container;
        border-radius: 16px;
        margin: 6px 2px;
      }

      #workspaces button.urgent {
        color: @error;
      }

      #clock {
        color: @primary;
        font-weight: 700;
      }

      tooltip {
        background: @surface_container;
        border-radius: 12px;
        border: 1px solid @outline_variant;
      }
      tooltip label {
        color: @on_surface;
      }
    '';
  };
}
