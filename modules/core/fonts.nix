{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      inter
      roboto
      roboto-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      material-symbols
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Serif CJK JP"
        ];
        sansSerif = [
          "Inter Display"
          "Noto Sans"
          "Noto Sans Thai"
          "Noto Sans CJK JP"
        ];
        monospace = [ "FiraCode Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
