{ inputs, pkgs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    dconf.enable = true;
    seahorse.enable = true;
    hyprlock.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # desktop apps
    vicinae
    nautilus
    loupe
    celluloid
    vesktop
    prismlauncher
    zed-editor

    # flake packages
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww

    # cli utils
    fzf
    ripgrep
    yazi
    lazygit
    killall
    unrar
    unzip
    nitch
    cmatrix
    spotify-player

    # ctl
    brightnessctl
    pavucontrol
    playerctl

    # lang
    javaPackages.compiler.temurin-bin.jre-25
    nodejs
    gcc
    glib
    nixd
    nil
    nixfmt
  ];
}
