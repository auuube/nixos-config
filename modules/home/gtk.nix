{ pkgs, user, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3.extraCss = ''
      @import 'colors.css';
    '';
    gtk4.extraCss = ''
      @import 'colors.css';
    '';
  };

  home.pointerCursor = {
    enable = true;
    name = "DMZ-Black";
    package = pkgs.vanilla-dmz;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
