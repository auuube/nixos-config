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

    nix-ld.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
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
    motrix-next

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
    claude-code

    # ctl
    brightnessctl
    pavucontrol
    playerctl
    easyeffects

    # lang
    javaPackages.compiler.temurin-bin.jre-26
    nodejs_latest
    python3
    gcc
    glib
    nixd
    deadnix
    statix
    nixfmt
  ];
}
