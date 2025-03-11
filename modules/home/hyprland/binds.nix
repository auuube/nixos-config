{
  wayland.windowManager.hyprland.settings = {
    
    ###################
    ### MY PROGRAMS ###
    ###################

    "$terminal" = "ghostty";
    "$fileManager" = "nautilus";
    "$menu" = "rofi -show drun";
    "$browser" = "zen";

    ####################
    ### KEY BINDINGS ###
    ####################

    "$mainMod" = "SUPER";

    bind = [
      
      "$mainMod, Q, killactive,"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, F, fullscreen"

      # app launch
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, M, exec, $fileManager"
      "$mainMod, B, exec, $browser"
      "$mainMod, SPACE, exec, $menu"

      # moving focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # moving windows
      "$mainMod SHIFT, left, swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up, swapwindow, u"
      "$mainMod SHIFT, down, swapwindow, d"

      # resizing windows
      "$mainMod ALT, left, resizeactive, -60 0"
      "$mainMod ALT, right, resizeactive, 60 0"
      "$mainMod ALT, up, resizeactive, 0 -60"
      "$mainMod ALT, down, resizeactive, 0 60"

      # switching workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # moving windows to workspaces
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"

      # scratchpad
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # screenshot
      "$mainMod SHIFT, C, exec, hyprshot -m region --clipboard-only"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mainMod, bracketright, exec, brightnessctl s 10%+"
      "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
