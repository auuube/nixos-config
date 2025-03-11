{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk-sans
      jetbrains-mono
      fira-code
      font-awesome
      material-icons
    ];
  };
}
