{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      # Set float and centering for dialog boxes
      rule = float(true), match:modal:1
      rule = center(true), match:modal:1

      # Layer rules — vicinae launcher is a wlr-layer-shell surface
      layerrule {
        name = vicinae-no-animation
        no_anim = on
        match:namespace = vicinae
      }

      # ── Tag: file-manager ──
      windowrule {
        name = File-Managers
        match:class = ^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$
        tag = +file-manager
      }

      # ── Tag: terminal ──
      windowrule {
        name = Terminals
        match:class = ^(com.mitchellh.ghostty|org.wezfurlong.wezterm|Alacritty|kitty|kitty-dropterm|dropterminal)$
        tag = +terminal
      }

      # ── Tag: browser ──
      windowrule {
        name = Brave-browser
        match:class = ^(Brave-browser(-beta|-dev|-unstable)?)$
        tag = +browser
      }

      windowrule {
        name = Firefox
        match:class = ^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$
        tag = +browser
      }

      windowrule {
        name = Google-chrome
        match:class = ^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$
        tag = +browser
      }

      windowrule {
        name = Thorium-browser
        match:class = ^([Tt]horium-browser|[Cc]achy-browser)$
        tag = +browser
      }

      # ── Tag: projects ──
      windowrule {
        name = vscodium
        match:class = ^(codium|codium-url-handler|VSCodium)$
        tag = +projects
      }

      windowrule {
        name = vscode
        match:class = ^(VSCode|code-url-handler)$
        tag = +projects
      }

      # ── Tag: im ──
      windowrule {
        name = Discord
        match:class = ^([Dd]iscord|[Ww]ebCord|[Vv]esktop|Equibop)$
        tag = +im
      }

      windowrule {
        name = Ferdium
        match:class = ^([Ff]erdium)$
        center = on
        float = on
        size = 60% = 70%
        tag = +im
      }

      windowrule {
        name = Whatsapp
        match:class = ^([Ww]hatsapp-for-linux)$
        tag = +im
      }

      windowrule {
        name = Telegram-desktop
        match:class = ^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$
        tag = +im
      }

      windowrule {
        name = teams-for-linux
        match:class = ^(teams-for-linux)$
        tag = +im
      }

      # ── Tag: games ──
      windowrule {
        name = gamescope
        match:class = ^(gamescope)$
        tag = +games
      }

      windowrule {
        name = steam-app
        match:class = ^(steam_app\d+)$
        tag = +games
      }

      windowrule {
        name = PrismLauncher
        match:class = ^(PrismLauncher)$
        tag = +games
      }

      # ── Tag: gamestore ──
      windowrule {
        name = Steam
        match:class = ^([Ss]team)$
        tag = +gamestore
      }

      windowrule {
        name = Lutris
        match:title = ^([Ll]utris)$
        tag = +gamestore
      }

      windowrule {
        name = heroicgameslauncher
        match:class = ^(com.heroicgameslauncher.hgl)$
        tag = +gamestore
      }

      # ── Tag: settings ──
      windowrule {
        name = gnome-disks
        match:class = ^(gnome-disks|wihotspot(-gui)?)$
        tag = +settings
      }

      windowrule {
        name = rofi
        match:class = ^([Rr]ofi)$
        tag = +settings
      }

      windowrule {
        name = FileRoller
        match:class = ^(file-roller|org.gnome.FileRoller)$
        tag = +settings
      }

      windowrule {
        name = NetworkManger
        match:class = ^(nm-applet|nm-connection-editor|blueman-manager)$
        tag = +settings
      }

      windowrule {
        name = PlusAudio
        match:class = ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$
        center = on
        tag = +settings
      }

      windowrule {
        name = nwg-look
        match:class = ^(nwg-look|qt5ct|qt6ct|[Yy]ad)$
        tag = +settings
      }

      windowrule {
        name = xdg-desktop-portal-gtk
        match:class = (xdg-desktop-portal-gtk)
        tag = +settings
      }

      windowrule {
        name = blueman
        match:class = (.blueman-manager-wrapped)
        tag = +settings
      }

      windowrule {
        name = nwg-displays
        match:class = (nwg-displays)
        tag = +settings
      }

      # ── Per-app rules ──
      windowrule {
        name = Resolve
        match:class = ^(\bresolve\b)$
        match:xwayland = 1
        no_blur = on
      }

      windowrule {
        name = Picture-in-Picture
        match:title = ^(Picture-in-Picture)$
        float = on
        move = 72% = 7%
        opacity = 0.95 = 0.75
        pin = 0
        keep_aspect_ratio = on
      }

      windowrule {
        name = ThunarFileMgr
        match:class = ([Tt]hunar)
        match:title = negative:(.*[Tt]hunar.*)
        center = on
        float = on
      }

      windowrule {
        name = Authentication-Required
        match:title = ^(Authentication Required)$
        center = on
        float = on
      }

      windowrule {
        name = WayPaper
        match:class = ^([Ww]aypaper)$
        float = on
      }

      windowrule {
        name = mpv-or-clapper
        match:class = ^(mpv|com.github.rafostar.Clapper)$
        float = on
      }

      windowrule {
        name = Celluloid
        match:class = ^(io.github.celluloid_player.Celluloid)$
        float = on
      }

      windowrule {
        name = codium-url-handler
        match:class = (codium|codium-url-handler|VSCodium)
        match:title = negative:(.*codium.*|.*VSCodium.*)
        float = on
      }

      windowrule {
        name = heroicgameslauncher-1
        match:class = ^(com.heroicgameslauncher.hgl)$
        match:title = negative:(Heroic Games Launcher)
        float = on
      }

      windowrule {
        name = Steam-popups
        match:class = ^([Ss]team)$
        match:title = negative:^([Ss]team)$
        float = on
      }

      windowrule {
        name = Add-Folder
        match:initial_title = (Add Folder to Workspace)
        float = on
        size = 70% = 60%
      }

      windowrule {
        name = Open-File
        match:initial_title = (Open Files)
        float = on
        size = 70% = 60%
      }

      windowrule {
        name = Wants-to-Save
        match:initial_title = (wants to save)
        float = on
      }

      # ── Generic rules ──
      windowrule {
        name = IdleInhibit-fullscreen
        match:fullscreen = 1
        idle_inhibit = fullscreen
      }

      # ── Tag-based effects ──
      windowrule {
        name = Settings-Tag
        match:tag = settings*
        float = on
        opacity = 0.8 = 0.7
        size = 70% = 70%
      }

      windowrule {
        name = Projects
        match:tag = projects*
        opacity = 0.9 = 0.8
      }

      windowrule {
        name = Instant-Messaging
        match:tag = im*
        opacity = 0.94 = 0.86
      }

      windowrule {
        name = File-Managers
        match:tag = file-manager*
        opacity = 0.9 = 0.8
      }

      windowrule {
        name = Terminals-opacity
        match:tag = terminal*
        opacity = 0.8 = 0.7
      }

      windowrule {
        name = Text-Editors
        match:class = ^(gedit|org.gnome.TextEditor|mousepad)$
        opacity = 0.8 = 0.7
      }

      windowrule {
        name = Seahorse
        match:class = ^(seahorse)$
        opacity = 0.9 = 0.8
      }

      windowrule {
        name = Games
        match:tag = games*
        no_blur = on
        fullscreen = on
      }
    '';
  };
}
