{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk-sans
      jetbrains-mono
      font-awesome
      material-icons
    ];
  };
}
