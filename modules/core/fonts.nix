{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      inter
      roboto
      roboto-mono
      dejavu_fonts
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      font-awesome
      material-symbols
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [
          "Inter Display"
          "Noto Sans"
          "Noto Sans Thai"
        ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
