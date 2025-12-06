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
    vesktop
    prismlauncher
    zed-editor

    # flake packages
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww

    # cli utils
    fzf
    ripgrep
    lazygit
    killall
    cliphist
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
    jre25_minimal
    nodejs
    gcc
    glib
    nixd
    nil
    nixfmt
  ];
}
