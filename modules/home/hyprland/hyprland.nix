{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # xwayland.enable = true;

    settings = {

      ################
      ### MONITORS ###
      ################

      monitor = ",1920x1080@180hz,auto,1";

      #################
      ### AUTOSTART ###
      #################

      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      
      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      general = { 
        gaps_in = 5;
        gaps_out = 8;

        border_size = 0;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(33ccffee)"; #rgba(00ff99ee) 0deg
        "col.inactive_border" = "rgba(595959aa)";

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
	inactive_opacity = 0.95;

	# https://wiki.hyprland.org/Configuring/Variables/#blur
	blur = {
          enabled = true;
	  vibrancy = 0.8;
	  contrast = 0.6;
	  size = 10;
	  passes = 2;
	  ignore_opacity = true;
        };

	shadow = {
          enabled = false;
          sharp = false;
	};

	#blurls = gtk-layer-shell
      };

      animations = {
        enabled = true;
	# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
	bezier = "myBezier, 0.05, 0.8, 0.1, 1";
	animation = [
	  "windows, 1, 6, myBezier"
	  "windowsOut, 1, 7, default, popin 90%"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default, slidevert"
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

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
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
