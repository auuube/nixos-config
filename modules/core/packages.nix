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
    equibop
    prismlauncher
    # flake packages
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

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
    opencode

    # ctl
    brightnessctl
    pavucontrol
    playerctl

    # lang
    javaPackages.compiler.temurin-bin.jre-26
    nodejs_latest
    gcc
    glib
    nixd
    nixfmt
  ];
}
