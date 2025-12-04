{ pkgs, ... }:

{
  gtk = {
    enable = true;
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
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.pointerCursor = {
    name = "DMZ-Black";
    package = pkgs.vanilla-dmz;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
