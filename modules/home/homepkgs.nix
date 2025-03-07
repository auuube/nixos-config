{ pkgs, inputs, system, ... }: {
  home.packages = with pkgs; [

    # Desktop apps
    inputs.zen-browser.packages."${system}".default
    nautilus
    obs-studio
    vesktop
    spotify
    prismlauncher

    # CLI utils
    fzf
    ripgrep
    superfile
    fastfetch
    btop
    neovim

    # hyprland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
